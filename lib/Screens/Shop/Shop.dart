import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/HomeComponents/Progress.dart';
import 'package:bid_and_shops/Components/Products/ShopProductBox.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/Themes/colors/AppColors.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Provider/CartProvider.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

@RoutePage()
class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  TextEditingController searchController = TextEditingController();

  List? products;

  getProducts() async {
    try {
      ApiRequest apiRequest = ApiRequest(path: "/api/products");
      Response data = await apiRequest.send();
      setState(() {
        products = data.data;
      });
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.error);
      }
      setState(() {
        products = [];
      });
    }
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

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
          GestureDetector(
            onTap: () {
              NavigateMe.push(context, CartRoute());
            },
            child: Center(
              child: Badge(
                backgroundColor: AppColors.primaryColorDark,
                label: Consumer<ManageCartList>(
                  builder: (context, value, child) {
                    return Text(
                      value.cartData.length.toString(),
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    );
                  },
                ),
                child: const Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(
                    FontAwesomeIcons.shoppingCart,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      // ignore: prefer_const_constructors
      body: Builder(builder: (context) {
        if (products == null) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Center(child: progress(context)),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              // const SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       SizedBox(width: 15),
              //       TabBar(title: "MOBILE"),
              //       TabBar(title: "HEADPHONS"),
              //       TabBar(title: "SPEKARS"),
              //       TabBar(title: "WATCH"),
              //       SizedBox(width: 15),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: searchController,
                      onEditingComplete: () {
                        NavigateMe.push(
                          context,
                          SearchRoute(
                            search: searchController.text,
                          ),
                        );
                      },
                      decoration: const InputDecoration(
                        labelText: "SEARCH ANYTHING",
                        labelStyle: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        hintText: "phone,speakers,headphone...",
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...List.generate(products!.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ShopProductBox(
                          data: products![index],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
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
      margin: const EdgeInsets.all(5),
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
