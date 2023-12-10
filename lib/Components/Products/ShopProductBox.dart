import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Provider/WishListProvider.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:bid_and_shops/Utils/getDiscount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ShopProductBox extends StatelessWidget {
  final Map data;
  const ShopProductBox({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigateMe.push(context, ProductLandingRoute(data: data));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ImageLoader(
                width: MediaQuery.of(context).size.width / 2 - 60,
                height: 160,
                imageUrl: "${ApiRequest().endPoint}/" + data['image'],
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child:
                    Consumer<ManageWishList>(builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () async {
                      await value.addToWishList(data['_id']);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Color.fromARGB(255, 41, 41, 41)
                            : Color.fromARGB(255, 236, 235, 235),
                      ),
                      child: Icon(
                        FontAwesomeIcons.solidHeart,
                        color: !value.wishlistData.contains(data['_id'])
                            ? Color.fromARGB(255, 221, 216, 216)
                            : Colors.pink,
                        size: 15,
                      ),
                    ),
                  );
                }),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  height: 20,
                  color: Colors.red,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "${getParcent(data['hintPrice'], data['price'])}% OFF",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['title'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
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
                  data['description'],
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "₹ ${data['hintPrice'].toDouble()}",
                  style: TextStyle(
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
                        text: data['price'].toDouble().toString(),
                        style: TextStyle(
                          fontSize: 18,
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
        ],
      ),
    );
  }
}
