import 'package:bid_and_shops/Components/Products/ProductBox.dart';
import 'package:flutter/material.dart';

class OurShop extends StatelessWidget {
  const OurShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "POPULER",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Opacity(
              opacity: 0.5,
              child: Text(
                "View Shop",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.spaceBetween,
            alignment: WrapAlignment.spaceBetween,
            children: [
              ProductBox(),
              ProductBox(),
              ProductBox(),
              ProductBox(),
              ProductBox(),
              ProductBox(),
              ProductBox(),
            ],
          ),
        )
      ],
    );
  }
}
