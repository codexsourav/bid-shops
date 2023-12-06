import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/Products/BidProductBox.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Components/Products/ShopProductBox.dart';

@RoutePage()
class BidShop extends StatelessWidget {
  const BidShop({super.key});

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
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartShopping,
              size: 18,
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BidProductBox(),
              SizedBox(height: 20),
              BidProductBox(),
              SizedBox(height: 20),
              BidProductBox(),
              SizedBox(height: 20),
              ShopProductBox(),
              SizedBox(height: 20),
              BidProductBox(),
              SizedBox(height: 20),
              SizedBox(height: 20),
              BidProductBox(),
              SizedBox(height: 20),
              SizedBox(height: 20),
              BidProductBox(),
              SizedBox(height: 20),
              SizedBox(height: 20),
              BidProductBox(),
              SizedBox(height: 20),
              SizedBox(height: 20),
              BidProductBox(),
              SizedBox(height: 20),
              SizedBox(height: 20),
              BidProductBox(),
              SizedBox(height: 20),
              SizedBox(height: 20),
              BidProductBox(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
