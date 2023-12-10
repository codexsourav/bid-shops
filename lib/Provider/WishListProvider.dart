import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:flutter/material.dart';

class ManageWishList extends ChangeNotifier {
  List _wishlistData = [];
  List get wishlistData => _wishlistData;

  Future addToWishList(id) async {
    if (wishlistData.contains(id)) {
      _wishlistData.remove(id);
    } else {
      _wishlistData.add(id);
    }
    notifyListeners();
    ApiRequest wishListReq =
        ApiRequest(path: "/api/wishlist/$id", method: "PATCH");
    await wishListReq.send();
  }

  setWishList(data) {
    _wishlistData = data;
    notifyListeners();
  }
}
