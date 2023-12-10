import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/HomeComponents/Progress.dart';
import 'package:bid_and_shops/Components/Products/BidProductBox.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/Themes/colors/AppColors.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Provider/CartProvider.dart';
import 'package:bid_and_shops/Provider/ManageBidsProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

@RoutePage()
class BidShop extends StatefulWidget {
  const BidShop({super.key});

  @override
  State<BidShop> createState() => _BidShopState();
}

class _BidShopState extends State<BidShop> {
  late ManageBidProvider manageBidProvider;

  @override
  void initState() {
    manageBidProvider = Provider.of<ManageBidProvider>(context, listen: false);
    if (manageBidProvider.bidData == null ||
        manageBidProvider.bidData!.isEmpty) {
      manageBidProvider.loadBidData();
    }
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
        title: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(width: 15),
            const Text(
              "Live Now",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              NavigateMe.push(context, CartRoute());
            },
            child: Center(
              child: Badge(
                backgroundColor: AppColors.primaryColorDark,
                label: Consumer<ManageCartList>(
                  builder: (context, value, child) {
                    return Text(
                      value.cartData.length.toString(),
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    );
                  },
                ),
                child: const Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(
                    FontAwesomeIcons.shoppingCart,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Consumer<ManageBidProvider>(
        builder: (context, value, child) {
          List? bids = value.bidData;
          return Builder(builder: (context) {
            if (bids == null) {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Center(child: progress(context)),
                ),
              );
            } else if (bids.isEmpty) {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Text("No Bids Live"),
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                await manageBidProvider.loadBidData();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      bids.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: BidProductBox(data: bids[index]),
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
