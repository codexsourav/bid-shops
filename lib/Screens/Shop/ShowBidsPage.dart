import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/Alerts/ShowBidAmmountPopup.dart';
import 'package:bid_and_shops/Components/HomeComponents/Progress.dart';
import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/Themes/colors/AppColors.dart';
import 'package:bid_and_shops/Provider/ManageBidsProvider.dart';
import 'package:bid_and_shops/Provider/UserProfileProvider.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ShowBidsPagee extends StatefulWidget {
  final Map? data;
  const ShowBidsPagee({super.key, this.data});

  @override
  State<ShowBidsPagee> createState() => _ShowBidsPageeState();
}

class _ShowBidsPageeState extends State<ShowBidsPagee> {
  PageController? controller = PageController();
  late ManageBidProvider manageBidProvider;

  int? pageindex;
  List? bidProducts;
  bool isLoading = false;

  loadBids() async {
    try {
      List data = manageBidProvider.bidData ?? [];
      setState(() {
        pageindex = 0;
        if (widget.data != null) {
          data.removeWhere((pid) => pid['_id'] == widget.data!['_id']);
        }
        bidProducts = widget.data == null ? data : [widget.data, ...data];
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      setState(() {
        pageindex = 0;
        bidProducts = widget.data == null ? [] : [widget.data];
      });
    }
  }

  placeNewBid({id, amount}) async {
    UserProfileProvider userProfileProvider =
        Provider.of<UserProfileProvider>(context, listen: false);
    print(amount);
    setState(() {
      isLoading = true;
    });
    Fluttertoast.showToast(msg: "Submitting Your Bid.");
    try {
      ApiRequest apiRequest = ApiRequest(
        path: "/api/bid/new/$id",
        method: "POST",
        body: {"amount": amount},
      );
      Response data = await apiRequest.send();

      if (data.data['success'] == true) {
        Fluttertoast.showToast(
          msg: data.data['error'] ??
              data.data['message'] ??
              "Something Want Wrong!",
          toastLength: Toast.LENGTH_SHORT,
        );
        setState(() {
          isLoading = false;
          bidProducts![pageindex!]['isAttemd'] = true;
          bidProducts![pageindex!]['userData'] = {
            "user": userProfileProvider.userData!['_id'],
            "amount": amount,
            "date": DateTime.now().toIso8601String(),
          };
          bidProducts![pageindex!]['users'].add({
            "user": userProfileProvider.userData!['_id'],
            "amount": amount,
            "date": DateTime.now().toIso8601String(),
          });

          manageBidProvider.setBidData(bidProducts);
        });
      } else {
        Fluttertoast.showToast(
          msg: data.data['error'] ??
              data.data['message'] ??
              "Something Want Wrong!",
        );
        setState(() {
          isLoading = false;
        });
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.error);
      }
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "Oh No, Bid Place Error!");
    }
  }

  @override
  void initState() {
    manageBidProvider = Provider.of<ManageBidProvider>(context, listen: false);
    loadBids();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            NavigateMe.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
        ),
        actions: [
          pageindex != null
              ? Container(
                  margin: const EdgeInsets.all(5),
                  height: 20,
                  color: AppColors.primaryColor,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "${bidProducts![pageindex!]['users'].length} BIDS",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          const SizedBox(width: 20)
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (context) {
        if (bidProducts == null) {
          return Center(
            child: progress(context),
          );
        } else if (bidProducts!.isEmpty) {
          return const Center(
            child: Text("No Bids Product Found!"),
          );
        }
        return PageView.builder(
          controller: controller,
          itemCount: bidProducts!.length,
          onPageChanged: (i) {
            setState(() {
              pageindex = i;
            });
          },
          itemBuilder: (context, index) {
            Map bidData = bidProducts![index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Text(
                        bidData['title'],
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: RatingBarIndicator(
                      rating: bidData['rating'].toDouble(),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "₹ ${bidData['hintPrice'].toDouble()}",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 196, 196, 196),
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    bidData['desc'],
                    maxLines: 10,
                  ),
                ),
                const SizedBox(height: 10),
                const Spacer(),
                ImageLoader(
                  width: 250,
                  height: 250,
                  imageUrl: "${ApiRequest().endPoint}/" + bidData['image'],
                ),
                const SizedBox(height: 30),
                Builder(
                  builder: (context) {
                    if (bidProducts![pageindex!]['isAttemd'] == true) {
                      return Text(
                        "Your Bid: ${bidProducts![pageindex!]['userData']['amount'] ?? 0}RS",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                    return NeoPopTiltedButton(
                      isFloating: true,
                      onTapUp: isLoading
                          ? null
                          : () {
                              HapticFeedback.vibrate();
                              showPlaceBidPopUP(
                                context,
                                bidData,
                                onSubmit: placeNewBid,
                              );
                            },
                      decoration: const NeoPopTiltedButtonDecoration(
                        color: Color.fromRGBO(224, 206, 44, 1),
                        plunkColor: Color.fromRGBO(235, 216, 49, 1),
                        shadowColor: Color.fromRGBO(36, 36, 36, 1),
                        showShimmer: true,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60.0,
                          vertical: 10,
                        ),
                        child: Text(
                          isLoading ? 'Loading..' : "Bid Now",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                const Spacer(),
              ],
            );
          },
        );
      }),
    );
  }
}
