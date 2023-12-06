import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:bid_and_shops/Screens/ComingSoon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Manager/Themes/colors/AppColors.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ComingSoon();
          },
        ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 35,
        height: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ImageLoader(
                  imageUrl:
                      "https://media.wired.com/photos/6332360740fe1e8870aa3bc0/master/pass/iPhone-14-Review-Gear.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Icon(
                        FontAwesomeIcons.solidHeart,
                        color: Color.fromARGB(255, 221, 216, 216),
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "I Phone 14 Pro Max",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: RatingBarIndicator(
                rating: 2.75,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 10.0,
                direction: Axis.horizontal,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "₹ 12999.00",
              style: TextStyle(
                color: Color.fromARGB(148, 172, 172, 172),
                decoration: TextDecoration.lineThrough,
                fontWeight: FontWeight.w800,
                fontSize: 10,
              ),
            ),
            SizedBox(height: 5),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '₹ ',
                    style: TextStyle(
                        color: AppColors.primaryColorDark,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '1200.00',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleSmall?.color,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
