import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sg_mobile/widgets/Login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(title: Text("Square Game"), backgroundColor: Colors.red),
        body: LoginWidget(),
      )
    );
  }


}
