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
    UserProfileProvider userProfileProvider =
        Provider.of<UserProfileProvider>(context);
    userProfileProvider.setUserData(data);
  }
}
