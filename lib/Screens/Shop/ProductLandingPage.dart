import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/Appbars/ProductAppbar.dart';
import 'package:bid_and_shops/Components/Products/ShopView/OurShop.dart';
import 'package:bid_and_shops/Components/Products/WrorkTools.dart';
import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/Themes/colors/AppColors.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Provider/CartProvider.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage()
class ProductLandingPage extends StatefulWidget {
  final Map data;
  const ProductLandingPage({super.key, required this.data});

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

  int cartCount = 1;

  addCount() {
    setState(() {
      cartCount = cartCount + 1;
    });
  }

  removeCount() {
    if (cartCount >= 2) {
      setState(() {
        cartCount = cartCount - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:
          ProductAppbar(context, transparent: transparentAppBar, onCartTap: () {
        NavigateMe.push(context, CartRoute());
      }),
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
                items: List.generate(
                    widget.data['gallery'].length,
                    (index) => ImageLoader(
                          // ignore: prefer_interpolation_to_compose_strings
                          imageUrl: "${ApiRequest().endPoint}/" +
                              widget.data['gallery'][index],
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                        ))),
            const SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    widget.data['gallery'].length,
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
                    widget.data['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "₹ ${widget.data['hintPrice'].toDouble()}",
                        style: const TextStyle(
                          color: Color.fromARGB(148, 172, 172, 172),
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
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
                              text: '${widget.data['price'].toDouble()}',
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
                        rating: widget.data['rating'].toDouble(),
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
                  const SizedBox(height: 15),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(widget.data['description']),
                  const SizedBox(height: 20),
                  const Text(
                    "SPECIFICATIONS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1.5,
                    margin: const EdgeInsets.only(top: 8),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(157, 255, 255, 255)
                        : const Color.fromARGB(185, 0, 0, 0),
                  ),
                  const SizedBox(height: 5),
                  ...List.generate(
                    widget.data['specs'].length,
                    (index) => SpecsList(
                      title: widget.data['specs'][index]['title'],
                      value: widget.data['specs'][index]['value'],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const OurShop(),
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
        child: Builder(builder: (context) {
          if (!widget.data['inStock']) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: NeoPopButton(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "OUT OF STOCK",
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.white
                                  : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: addCount, icon: const Icon(Icons.add)),
                    const SizedBox(width: 8),
                    Text(
                      cartCount.toString(),
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                        onPressed: removeCount, icon: const Icon(Icons.remove)),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 10,
                  child: NeoPopButton(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    onTapUp: () {
                      Provider.of<ManageCartList>(context, listen: false)
                          .manageCart(widget.data['_id'], cartCount);
                      HapticFeedback.vibrate();
                      setState(() {
                        cartCount = 1;
                      });
                      Fluttertoast.showToast(
                        msg: "Product Added To Your Cart",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        fontSize: 16.0,
                      );
                    },
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
              ]);
        }),
      ),
    );
  }
}
