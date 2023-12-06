import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/Appbars/ProductAppbar.dart';
import 'package:bid_and_shops/Components/Products/ShopView/OurShop.dart';
import 'package:bid_and_shops/Components/Products/WrorkTools.dart';
import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:bid_and_shops/Manager/Themes/colors/AppColors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';

@RoutePage()
class ProductLandingPage extends StatefulWidget {
  const ProductLandingPage({super.key});

  @override
  State<ProductLandingPage> createState() => _ProductLandingPageState();
}

class _ProductLandingPageState extends State<ProductLandingPage> {
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset >= 400) {
        if (transparentAppBar != false) {
          setState(() {
            transparentAppBar = false;
          });
        }
      } else {
        if (transparentAppBar == false) {
          setState(() {
            transparentAppBar = true;
          });
        }
      }
    });
  }

  CarouselController carouselController = CarouselController();

  int slideIndex = 0;

  ScrollController scrollController = ScrollController();
  bool transparentAppBar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ProductAppbar(context, transparent: transparentAppBar),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 1,
                  onPageChanged: (index, r) {
                    setState(() {
                      slideIndex = index;
                    });
                  }),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return ImageLoader(
                      imageUrl:
                          "https://cdn.mos.cms.futurecdn.net/kbrdKHwjXBwSp9uiY8hejP-1200-80.jpg",
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    5,
                    (index) => sliderDots(
                          isActive: slideIndex == index,
                        ))),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I PHone 15 PRO Max 120 GB Ram wrere w erwe rewr",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "₹ 12999.00",
                        style: TextStyle(
                          color: Color.fromARGB(148, 172, 172, 172),
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '₹ ',
                              style: TextStyle(
                                  color: AppColors.primaryColorDark,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '1200.00',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 18.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                      "NeoPOP was created with one simple goal; to create the next generation of a beautiful, affirmative design system. NeoPOP stays true to everything that design at CRED stands for."),
                  SizedBox(height: 20),
                  Text(
                    "SPECIFICATIONS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1.5,
                    margin: EdgeInsets.only(top: 8),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(157, 255, 255, 255)
                        : const Color.fromARGB(185, 0, 0, 0),
                  ),
                  SizedBox(height: 5),
                  SpecsList(title: "RAM", value: "120 GB"),
                  SpecsList(title: "COLOR", value: "BLACK"),
                  SpecsList(title: "BATTERY", value: "5000 MAH"),
                  SizedBox(height: 20),
                  OurShop(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  SizedBox(width: 8),
                  Text(
                    "5",
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 10,
                child: NeoPopButton(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  onTapUp: () => HapticFeedback.vibrate(),
                  onTapDown: () => HapticFeedback.vibrate(),
                  parentColor: Colors.transparent,
                  buttonPosition: Position.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ADD TO CART",
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
