import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/HomeComponents/Progress.dart';
import 'package:bid_and_shops/Components/Products/ShopProductBox.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  final String search;
  const SearchPage({super.key, this.search = ""});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List? products;
  bool? loading;

  TextEditingController searchController = TextEditingController();

  searchProducts() async {
    if (searchController.text.isNotEmpty) {
      try {
        setState(() {
          loading = true;
        });
        ApiRequest apiRequest = ApiRequest(
          path: "/api/products/search/${searchController.text}",
          method: "GET",
        );
        Response data = await apiRequest.send();
        setState(() {
          loading = false;
          products = data.data;
        });
      } catch (e) {
        setState(
          () {
            loading = false;
            products = [];
          },
        );
      }
    }
  }

  @override
  void initState() {
    searchController.text = widget.search;
    if (searchController.text.isNotEmpty) {
      searchProducts();
    }
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
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              TextField(
                controller: searchController,
                autofocus: searchController.text.isEmpty,
                onEditingComplete: () {
                  searchProducts();
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                decoration: const InputDecoration(
                  labelText: "SEARCH ANYTHING",
                  labelStyle:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  hintText: "phone,spekars,headphone...",
                ),
              ),
              (products == null && loading == null)
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "RESULT : ${searchController.text}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
              Builder(
                builder: (context) {
                  if (products == null && loading == null) {
                    return const SizedBox();
                  } else if (loading == true) {
                    return Center(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: Center(child: progress(context))),
                    );
                  } else if (products!.isEmpty) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: const Center(
                        child: Text("No Search Results Found"),
                      ),
                    );
                  } else {
                    return Column(
                      children: List.generate(
                        products!.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ShopProductBox(data: products![index]),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
