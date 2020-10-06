import 'package:flutter/material.dart';
import 'package:pizza_delivery_app/app/modules/login/auth/view/login_page.dart';
import 'package:pizza_delivery_app/app/modules/splash/controller/splash_controller.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  static const router = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => SplashController(),
        child: SplashContent(),
      ),
    );
  }
}

class SplashContent extends StatefulWidget {
  @override
  _SplashContentState createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => Navigator.of(context)
      .pushNamedAndRemoveUntil(LoginPage.router, (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
