import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/Alerts/VerifyEmailpopup.dart';
import 'package:bid_and_shops/Components/BottamNavigationBar.dart';
import 'package:bid_and_shops/Components/HomeComponents/ExploreApp.dart';
import 'package:bid_and_shops/Components/MyDrawer.dart';
import 'package:bid_and_shops/Components/Products/ShopView/OurShop.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Screens/ComingSoon.dart';
import 'package:bid_and_shops/Screens/Shop/searchPage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            leading: IconButton(
              onPressed: () => _scaffoldKey.currentState!.openDrawer(),
              icon: Icon(
                Ionicons.grid_outline,
                size: 20,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    // showVerifYGmail(context);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return SearchPage();
                      },
                    ));
                  },
                  icon: const Icon(
                    Ionicons.search_outline,
                    size: 22,
                  )),
              const SizedBox(width: 5),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ComingSoon();
                      },
                    ));
                  },
                  icon: const Icon(
                    Ionicons.heart_outline,
                    size: 22,
                  )),
              const SizedBox(width: 10),
            ]),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  height: 180,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          NavigateMe.pushNamed(context, "/bidexploreshop");
                        },
                        child: Image.asset(
                          "assets/slide2.webp",
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: NeoPopButton(
                      color: const Color.fromARGB(255, 247, 18, 64),
                      bottomShadowColor: const Color.fromARGB(255, 177, 52, 52),
                      rightShadowColor: const Color.fromARGB(144, 155, 41, 41),
                      buttonPosition: Position.fullBottom,
                      depth: 5,
                      onTapUp: () {
                        NavigateMe.push(context, BidShop());
                        // NavigateMe.push(context, Shop());
                        // NavigateMe.push(context, BidExploreSection());
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Center(
                          child: Text(
                            "LIVE BIDING",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: const ExploreApp(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: OurShop(),
              ),
            ],
          ),
        ),
        drawer: myDrawer(context),
        bottomNavigationBar: bottomNavigationBar(context, (i) {
          if (i == 0) {
          } else if (i == 1) {
            NavigateMe.push(context, Shop());
          } else if (i == 2) {
            NavigateMe.push(context, CartRoute());
          } else {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return ComingSoon();
              },
            ));
          }
        }));
  }
}
