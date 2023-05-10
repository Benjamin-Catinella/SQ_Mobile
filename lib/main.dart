
import 'package:flutter/material.dart';
import 'package:sg_mobile/widgets/login.dart';
import 'package:sg_mobile/widgets/square_game_app_bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: SquareGameAppBar(),
        resizeToAvoidBottomInset: false,
        body: LoginWidget(),
      )
    );
  }


}
