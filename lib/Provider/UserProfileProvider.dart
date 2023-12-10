import 'package:bid_and_shops/Provider/CartProvider.dart';
import 'package:bid_and_shops/Provider/WishListProvider.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileProvider extends ChangeNotifier {
  Map? _userData;
  Map? get userData => _userData;

  void setUserData(Map data) {
    _userData = data;
    notifyListeners();
  }
}

class SetUserProvider {
  static setUser(context, data) {
    List _cartData = [];
    for (var i = 0; i < data['cart'].length; i++) {
      _cartData.add(data['cart'][i]['productId']);
    }
    UserProfileProvider userProfileProvider =
        Provider.of<UserProfileProvider>(context, listen: false);
    ManageWishList w = Provider.of<ManageWishList>(context, listen: false);
    ManageCartList c = Provider.of<ManageCartList>(context, listen: false);

    userProfileProvider.setUserData(data);
    w.setWishList(data['watchList']);
    c.setCart(_cartData);
  }

  static Future<void> setAppUserData(context) async {
    ApiRequest wishListReq = ApiRequest(path: "/api/profile", method: "GET");
    Response userDataRes = await wishListReq.send();
    Map userData = userDataRes.data;
    List _cartData = [];
    for (var i = 0; i < userData['cart'].length; i++) {
      _cartData.add(userData['cart'][i]['productId']);
    }

    ManageWishList w = Provider.of<ManageWishList>(context, listen: false);
    ManageCartList c = Provider.of<ManageCartList>(context, listen: false);
    UserProfileProvider userProfileProvider =
        Provider.of<UserProfileProvider>(context, listen: false);

    userProfileProvider.setUserData(userData);
    w.setWishList(userData['watchList']);
    c.setCart(_cartData);
  }
}
