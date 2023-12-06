import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/Products/ShopProductBox.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class Shop extends StatelessWidget {
  const Shop({super.key});

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
        title: const Text(
          "SHOP",
          style: TextStyle(fontWeight: FontWeight.bold),
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
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 15),
                  TabBar(title: "MOBILE"),
                  TabBar(title: "HEADPHONS"),
                  TabBar(title: "SPEKARS"),
                  TabBar(title: "WATCH"),
                  SizedBox(width: 15),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                      labelText: "SEARCH ANYTHING",
                      labelStyle:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      hintText: "phone,spekars,headphone..."),
                ),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
                ShopProductBox(),
                SizedBox(height: 20),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBar extends StatelessWidget {
  final String title;
  const TabBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 35,
      color: Theme.of(context).brightness == Brightness.light
          ? const Color.fromARGB(255, 19, 19, 19)
          : Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "$title",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
