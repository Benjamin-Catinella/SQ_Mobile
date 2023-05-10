import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sg_mobile/widgets/Login.dart';
import 'package:sg_mobile/widgets/SquareGameAppBar.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoginWidget(),
      )
    );
  }


}
