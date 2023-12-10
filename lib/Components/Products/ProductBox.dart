// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Provider/WishListProvider.dart';
import 'package:bid_and_shops/Screens/ComingSoon.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../Manager/Themes/colors/AppColors.dart';

class ProductBox extends StatelessWidget {
  final Map data;
  const ProductBox({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigateMe.push(context, ProductLandingRoute(data: data));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 35,
        height: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ImageLoader(
                  imageUrl: "${ApiRequest().endPoint}/" + data['image'],
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Consumer<ManageWishList>(
                        builder: (context, value, child) {
                      return GestureDetector(
                        onTap: () async {
                          await value.addToWishList(data['_id']);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color.fromARGB(255, 41, 41, 41)
                                    : const Color.fromARGB(255, 236, 235, 235),
                          ),
                          child: Icon(
                            FontAwesomeIcons.solidHeart,
                            color: !value.wishlistData.contains(data['_id'])
                                ? const Color.fromARGB(120, 194, 189, 189)
                                : const Color.fromARGB(255, 223, 62, 116),
                            size: 15,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              data['title'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: RatingBarIndicator(
                rating: data['rating'].toDouble(),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 10.0,
                direction: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "₹ ${data['hintPrice'].toDouble()}",
              style: const TextStyle(
                color: Color.fromARGB(148, 172, 172, 172),
                decoration: TextDecoration.lineThrough,
                fontWeight: FontWeight.w800,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 5),
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
                    text: '${data['price'].toDouble()}',
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
