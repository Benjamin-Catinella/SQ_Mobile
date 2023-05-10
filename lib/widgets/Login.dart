import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

const double inputFieldHorizontalPadding = 30.0;

class LoginWidget extends StatelessWidget {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          inputFieldHorizontalPadding, 0, inputFieldHorizontalPadding, 0),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage('images/connexion_image-removebg-preview.png'),
                    width: 200,
                    height: 200,
                  ),
                  Text(
                    'Connexion',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Bienvenue sur Square Game !',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  )
                ],
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Identifiant',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                  textAlign: TextAlign.left,
                ),
                TextField(
                  controller: loginController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Identifiant',
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mot de passe',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Identifiant',
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                sendLogin();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Se connecter'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Mot de passe oublié ?',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Inscription",
                  style: TextStyle(fontSize: 15, color: Colors.red),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void sendLogin() async {
    var URL = Uri.parse('http://localhost:8080/api/1/sessions');
    var response = await post(
      URL,
      headers: setHeader(),
      body: setBody(),
    );

    printResponseStatus(response);
  }

  String setBody() {
    return jsonEncode(<String, String>{
      'login': loginController.text,
      'password': passwordController.text,
    });
  }

  Map<String, String> setHeader() {
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

  void printResponseStatus(response) {
    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } else {
      //TODO: TOASTR MESSAGE
      throw Exception('Failed to create session.');
    }
  }
}
