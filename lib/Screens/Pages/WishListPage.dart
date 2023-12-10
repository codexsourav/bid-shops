import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/Appbars/ProductAppbar.dart';
import 'package:bid_and_shops/Components/HomeComponents/Progress.dart';
import 'package:bid_and_shops/Components/Products/ProductBox.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  List? wishlistData;

  getWishList() async {
    try {
      ApiRequest apiRequest = ApiRequest(path: "/api/wishlist");
      Response data = await apiRequest.send();
      setState(
        () {
          wishlistData = data.data;
        },
      );
    } catch (e) {
      setState(() {
        wishlistData = [];
      });
    }
  }

  @override
  void initState() {
    getWishList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductAppbar(context,
          title: const Text(
            "My WishList",
            style: TextStyle(fontWeight: FontWeight.bold),
          ), onCartTap: () {
        NavigateMe.push(context, const CartRoute());
      }),
      body: Builder(builder: (context) {
        if (wishlistData == null) {
          return Center(
            child: progress(context),
          );
        } else if (wishlistData!.isEmpty) {
          return const Center(
            child: Text("No WihList : ("),
          );
        }

        return SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.spaceBetween,
                alignment: WrapAlignment.spaceBetween,
                children: List.generate(wishlistData!.length, (index) {
                  return ProductBox(data: wishlistData![index]);
                }),
              ),
            ),
          ),
        );
      }),
    );
  }
}
