import 'package:bid_and_shops/Components/Products/ProductBox.dart';
import 'package:bid_and_shops/Components/Products/ShopProductBox.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "SEARCH ANYTHING",
                  labelStyle:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  hintText: "phone,spekars,headphone..."),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "RESULT : I Phone",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            ShopProductBox(),
          ],
        ),
      ),
    );
  }
}
