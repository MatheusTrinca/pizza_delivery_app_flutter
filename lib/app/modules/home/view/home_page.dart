import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static const router = '/home';

  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), centerTitle: true,),
      body: Container(),
    );
  }
}