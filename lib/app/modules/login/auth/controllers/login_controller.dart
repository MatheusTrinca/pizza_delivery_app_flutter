import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier{
  bool showLoader;
  String error;
  bool success;

  Future<void> login(String email, String password) async {
    showLoader = true;
    error = null;
    success = false;
    notifyListeners();

  await Future.delayed(Duration(seconds: 2), () {});
    showLoader = false;
    notifyListeners();

  }
}