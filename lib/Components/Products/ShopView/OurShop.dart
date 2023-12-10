import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/HomeComponents/Progress.dart';
import 'package:bid_and_shops/Components/Products/ProductBox.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OurShop extends StatefulWidget {
  const OurShop({super.key});

  @override
  State<OurShop> createState() => _OurShopState();
}

class _OurShopState extends State<OurShop> {
  List? products;
  Future getPoducts() async {
    try {
      ApiRequest populerProducts =
          ApiRequest(path: "/api/products/popular", method: "GET");
      Response productsData = await populerProducts.send();

      setState(() {
        products = productsData.data;
      });
    } on DioException catch (e) {
      print(e.error);
      setState(() {
        products = [];
      });
    }
  }

  @override
  void initState() {
    getPoducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: const Text(
                "POPULER",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            GestureDetector(
              onTap: () {
                NavigateMe.push(context, Shop());
              },
              child: const Opacity(
                opacity: 0.5,
                child: Text(
                  "View Shop",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Builder(builder: (context) {
          if (products == null) {
            return SizedBox(
              height: 200,
              child: Center(
                child: progress(context),
              ),
            );
          }
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.spaceBetween,
              alignment: WrapAlignment.spaceBetween,
              children: List.generate(products!.length, (index) {
                return ProductBox(data: products![index]);
              }),
            ),
          );
        })
      ],
    );
  }
}
