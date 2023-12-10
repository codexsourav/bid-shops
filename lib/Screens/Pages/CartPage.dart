import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/Appbars/ProductAppbar.dart';
import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/Themes/colors/AppColors.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Provider/CartProvider.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:provider/provider.dart';

import '../../Components/HomeComponents/Progress.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List? products;

  void loadData() async {
    try {
      ApiRequest apiRequest = ApiRequest(path: "/api/cart", method: "GET");
      Response response = await apiRequest.send();
      setState(
        () {
          products = response.data['cart'];
        },
      );
    } catch (e) {
      setState(() {
        products = [];
      });
    }
  }

  removeCart(id, index) {
    ManageCartList manageCartList =
        Provider.of<ManageCartList>(context, listen: false);
    setState(() {
      products!.removeAt(index);
    });
    manageCartList.removeCart(id);
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  double setTotalPrice(List data) {
    double total = 0;
    for (var i = 0; i < data.length; i++) {
      double qut = data[i]['quantity'].toDouble();
      double price = data[i]['productDetails']['price'].toDouble();
      if (data[i]['productDetails']['inStock']) {
        total = total + (price * qut);
      }
    }
    return total.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductAppbar(
        context,
        title: const Text(
          "Your Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Builder(builder: (context) {
        if (products == null) {
          return Center(
            child: progress(context),
          );
        } else if (products!.isEmpty) {
          return const Center(
            child: Text("No Products On Your Cart"),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                children: List.generate(
              products!.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (i) {
                    removeCart(
                      products![index]['productDetails']['_id'],
                      index,
                    );
                  },
                  child: Stack(
                    children: [
                      !products![index]['productDetails']['inStock']
                          ? SizedBox(
                              height: 100,
                              child: Center(
                                child: Text(
                                  "Out Of Stock",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            )
                          : SizedBox(),
                      Opacity(
                        opacity: products![index]['productDetails']['inStock']
                            ? 1.0
                            : 0.2,
                        child: GestureDetector(
                          onTap: () {
                            NavigateMe.push(
                              context,
                              ProductLandingRoute(
                                data: products![index]['productDetails'],
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImageLoader(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 80,
                                height: 100,
                                imageUrl:
                                    "${ApiRequest().endPoint}/${products![index]['productDetails']['image']}",
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 2 + 20,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      products![index]['productDetails']
                                              ['title']
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "₹ ${products![index]['productDetails']['hintPrice'].toDouble()}",
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 196, 196, 196),
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 10,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: '₹ ',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 180, 54, 54),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text: products![index]
                                                    ['productDetails']['price']
                                                .toDouble()
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.color,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'QYT: ',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 180, 54, 54),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text: products![index]['quantity']
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.color,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ),
        );
      }),
      bottomNavigationBar: (products == null || products!.isEmpty)
          ? null
          : Container(
              height: 80,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Colors.black,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TOTAL:",
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '₹ ',
                                style: TextStyle(
                                    color: AppColors.primaryColorDark,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: setTotalPrice(products!).toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      child: NeoPopButton(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        onTapUp: () => HapticFeedback.vibrate(),
                        onTapDown: () => HapticFeedback.vibrate(),
                        parentColor: Colors.transparent,
                        buttonPosition: Position.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "PLACE ORDER",
                                style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
    );
  }
}
