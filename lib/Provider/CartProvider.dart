import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ManageCartList extends ChangeNotifier {
  List _cartData = [];
  List get cartData => _cartData;

  setCart(data) {
    _cartData = data;
    notifyListeners();
  }

  Future manageCart(id, qut) async {
    if (!cartData.contains(id)) {
      _cartData.add(id);
      notifyListeners();
    }
    ApiRequest apiRequest = ApiRequest(
      path: "/api/cart",
      method: "patch",
      body: {"id": id, "qut": qut},
    );
    await apiRequest.send();
  }

  Future removeCart(id) async {
    if (cartData.contains(id)) {
      _cartData.remove(id);
      notifyListeners();

      ApiRequest apiRequest = ApiRequest(
        path: "/api/cart/$id",
        method: "DELETE",
      );
      Response data = await apiRequest.send();
      print(data);
    }
  }
}
