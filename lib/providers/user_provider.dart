import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/auth_method.dart';

import '../model/user_model.dart';

class UserProvider with ChangeNotifier {
  final AuthMethods _authMethods = AuthMethods();
  User? _user;

  User? get getUser => _user;
  bool get isLoggedIn => _user != null;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
