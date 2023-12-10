import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ManageBidProvider extends ChangeNotifier {
  List? _bidsData;
  List? get bidData => _bidsData;

  loadBidData() async {
    try {
      ApiRequest apiRequest = ApiRequest(path: "/api/bids");
      Response data = await apiRequest.send();
      _bidsData = data.data;
      notifyListeners();
    } catch (e) {
      _bidsData = [];
      notifyListeners();
    }
  }

  setBidData(data) {
    _bidsData = data;
    notifyListeners();
  }
}
