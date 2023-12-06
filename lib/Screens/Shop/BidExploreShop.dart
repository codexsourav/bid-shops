import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/Alerts/ShowBidAmmountPopup.dart';
import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:neopop/neopop.dart';

@RoutePage()
class BidExploreSection extends StatelessWidget {
  const BidExploreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: const Text(
                      'I Phone 14 PRO Max',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: RatingBarIndicator(
                    rating: 2.75,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                ),
              ),
              const Spacer(),
              const ImageLoader(
                width: 250,
                height: 250,
                imageUrl:
                    "https://img.freepik.com/premium-photo/3d-headphones-icon-isometric-view-generative-ai_971989-1690.jpg",
              ),
              const SizedBox(height: 30),
              NeoPopTiltedButton(
                isFloating: true,
                onTapUp: () {
                  showPlaceBidPopUP(context);
                },
                decoration: const NeoPopTiltedButtonDecoration(
                  color: Color.fromRGBO(224, 206, 44, 1),
                  plunkColor: Color.fromRGBO(235, 216, 49, 1),
                  shadowColor: Color.fromRGBO(36, 36, 36, 1),
                  showShimmer: true,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 60.0,
                    vertical: 10,
                  ),
                  child: Text(
                    'BID NOW',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
