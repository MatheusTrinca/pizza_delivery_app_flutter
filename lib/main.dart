import 'package:flutter/material.dart';
import 'package:pizza_delivery_app/app/modules/login/auth/view/login_page.dart';
import 'package:pizza_delivery_app/app/modules/splash/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Delivery',
      theme: ThemeData(
        primaryColor: Color(0XFF9D0000),
        primarySwatch: Colors.red,
      ),
      initialRoute: SplashPage.router,
      routes: {
        SplashPage.router: (_) => SplashPage(),
        LoginPage.router: (_) => LoginPage()
      },
    );
  }
}
