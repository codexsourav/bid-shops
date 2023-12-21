// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bid_and_shops/Components/HomeComponents/Progress.dart';
import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:bid_and_shops/Helper/MakeProvider.dart';
import 'package:bid_and_shops/Helper/Navigate/Navigation.dart';
import 'package:bid_and_shops/Helper/SnackBar/showSnackBar.dart';
import 'package:bid_and_shops/Manager/Themes/colors/AppColors.dart';
import 'package:bid_and_shops/Provider/CartProvider.dart';
import 'package:bid_and_shops/Screens/Order/AddressPage.dart';
import 'package:bid_and_shops/Screens/Order/CongressPage.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';

class OrderPreviewPage extends StatefulWidget {
  const OrderPreviewPage({super.key});

  @override
  State<OrderPreviewPage> createState() => _OrderPreviewPageState();
}

class _OrderPreviewPageState extends State<OrderPreviewPage> {
  bool isLoading = false;
  Map? orderData;
  List products = [];

  Future getOrderProducts() async {
    try {
      ApiRequest apiRequest = ApiRequest(
        path: "/api/order/products",
        method: "GET",
      );
      Response response = await apiRequest.send();

      if (response.data['success'] == true) {
        setState(() {
          orderData = response.data;
          products = response.data['products'];
        });
      } else {
        ShowSnackBar(context,
            contentType: ContentType.failure,
            message: "Products Load Field",
            title: "Error");
      }
    } catch (e) {
      ShowSnackBar(context,
          contentType: ContentType.failure,
          message: "Products Load Field",
          title: "Error");
    }
  }

  placeOrder() async {
    try {
      ApiRequest apiRequest = ApiRequest(
        path: "/api/order",
        method: "POST",
        body: {
          "products": products
              .map((e) => ({"productId": e['productId'], "qut": e['quantity']}))
              .toList(),
          "price": orderData!['total'],
        },
      );
      setState(() {
        isLoading = true;
      });
      print(apiRequest.body);
      Response response = await apiRequest.send();

      setState(() {
        isLoading = false;
      });
      if (response.statusCode == 201) {
        UseProvider<ManageCartList>(context, listen: false).clearCart();
        Navigation.pop(context);
        Navigation.push(context, page: CongressPage());
      }
    } on DioException catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
      ShowSnackBar(context,
          contentType: ContentType.failure,
          message: "Place Order Field",
          title: "Error");
    }
  }

  @override
  void initState() {
    getOrderProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigation.pop(context);
          },
          icon: const Center(
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
              ),
            ),
          ),
        ),
        title: const Text("Order"),
      ),
      body: Builder(builder: (context) {
        if (orderData == null) {
          return Center(
            child: progress(context),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                products.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, left: 20, right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageLoader(
                        width: MediaQuery.of(context).size.width / 2 - 80,
                        height: 100,
                        imageUrl:
                            "${ApiRequest().endPoint}/${products![index]['productDetails']['image']}",
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 + 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products![index]['productDetails']['title']
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
                                color: Color.fromARGB(255, 196, 196, 196),
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
                                        color: Color.fromARGB(255, 180, 54, 54),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: products![index]['productDetails']
                                            ['price']
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
                                        color: Color.fromARGB(255, 180, 54, 54),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        products![index]['quantity'].toString(),
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Select Payment Option",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )),
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: Radio(
                      value: 1,
                      groupValue: 1,
                      onChanged: (value) {},
                    ),
                    title: const Text("Cash On Delivery"),
                  ),
                  Opacity(
                    opacity: 0.3,
                    child: ListTile(
                      onTap: () {
                        Fluttertoast.showToast(msg: "Coming Soon");
                      },
                      leading: Radio(
                        value: 0,
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                      title: const Text("Pay With UPI"),
                    ),
                  ),
                  Opacity(
                    opacity: 0.3,
                    child: ListTile(
                      onTap: () {
                        Fluttertoast.showToast(msg: "Coming Soon");
                      },
                      leading: Radio(
                        value: 0,
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                      title: const Text("Credit/Dabit Card"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: (orderData == null)
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
                            color:
                                Theme.of(context).brightness == Brightness.dark
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
                              text: orderData!['total'].toDouble().toString(),
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
                      onTapUp: isLoading
                          ? null
                          : () async {
                              await placeOrder();
                              HapticFeedback.vibrate();
                            },
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
                              "ORDER NOW",
                              style: TextStyle(
                                color: (Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.white
                                    : Colors.black),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
