import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:bid_and_shops/Helper/Navigate/Navigation.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:bid_and_shops/Utils/ThemeColor.dart';
import 'package:flutter/material.dart';

class TrackOrders extends StatelessWidget {
  final Map Order;
  const TrackOrders({super.key, required this.Order});

  getTotal() {
    int total = 0;
    if (Order != null) {
      for (var i = 0; i < Order['products'].length; i++) {
        total = total + int.parse(Order['products'][i]['qut'].toString());
      }
    }
    return total;
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
        title: const Text("Track Order"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  Order['products'].length,
                  (index) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Badge(
                      label: Text(Order['products'][index]['qut'].toString()),
                      backgroundColor: themeColor(context),
                      child: ImageLoader(
                        imageUrl: ApiRequest().endPoint +
                            "/" +
                            Order['products'][index]['image'],
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ShippingAddressCard(
              fullName: Order['address']['fullName'],
              addressLine1: Order['address']['addressLine1'],
              addressLine2: Order['address']['addressLine2'],
              city: Order['address']['city'],
              state: Order['address']['state'],
              postalCode: Order['address']['postalCode'],
              country: Order['address']['country'],
            ),
            SizedBox(height: 20),
            OrderStatusBox(
              orderStatus: Order['status'],
              totalPrice: int.parse(Order['price'].toString()).toDouble(),
              itemsCount: getTotal(),
            ),
          ],
        ),
      ),
    );
  }
}

class ShippingAddressCard extends StatelessWidget {
  final String fullName;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String postalCode;
  final String country;

  ShippingAddressCard({
    required this.fullName,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shipping Address',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Name: $fullName'),
          Text('Address Line 1: $addressLine1'),
          Text('Address Line 2: $addressLine2'),
          Text('City: $city'),
          Text('State: $state'),
          Text('Postal Code: $postalCode'),
          Text('Country: $country'),
        ],
      ),
    );
  }
}

class OrderStatusBox extends StatelessWidget {
  final String orderStatus;
  final double totalPrice;
  final int itemsCount;

  OrderStatusBox({
    required this.orderStatus,
    required this.totalPrice,
    required this.itemsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Status',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Status: $orderStatus'),
          SizedBox(height: 16),
          Text(
            'Price Summary',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Total Items: $itemsCount'),
          Text('Total Price: ₹${totalPrice.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
