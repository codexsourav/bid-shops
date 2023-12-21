import 'package:bid_and_shops/Components/HomeComponents/Progress.dart';
import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:bid_and_shops/Helper/Navigate/Navigation.dart';
import 'package:bid_and_shops/Screens/Order/myOrders/TeackOrders.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ViewOrders extends StatefulWidget {
  const ViewOrders({super.key});

  @override
  State<ViewOrders> createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  List? myOrders;

  loadOrders() async {
    try {
      ApiRequest apiRequest = ApiRequest(
        path: "/api/myorders",
        method: "GET",
      );
      Response response = await apiRequest.send();
      setState(() {
        myOrders = response.data;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    loadOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigation.pop(context);
          },
          icon: const Center(
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
              ),
            ),
          ),
        ),
        title: const Text("My Orders"),
      ),
      body: Builder(
        builder: (context) {
          if (myOrders == null) {
            return Center(child: progress(context));
          } else if (myOrders!.isEmpty) {
            return Center(
              child: Text("No Orders Found!"),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  myOrders!.length,
                  (index) => Column(
                    children: List.generate(
                      myOrders![index]['products'].length,
                      (i) => GestureDetector(
                        onTap: () {
                          Navigation.push(
                            context,
                            page: TrackOrders(
                              Order: myOrders![index],
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.only(bottom: 20),
                          child: OrdersViewBox(
                            image: myOrders![index]['products'][i]['image'],
                            title: myOrders![index]['products'][i]['title'],
                            status: myOrders![index]['status'],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class OrdersViewBox extends StatelessWidget {
  final String title;
  final String image;
  final String status;

  const OrdersViewBox({
    super.key,
    required this.image,
    required this.status,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 20),
        ImageLoader(
          imageUrl: ApiRequest().endPoint + "/" + image,
          height: 80,
          width: 80,
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width - 150,
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Opacity(
                opacity: 0.8,
                child: Text(
                  status,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
