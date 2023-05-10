import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sg_mobile/widgets/square_game_app_bar.dart';

import 'inputs.dart';

const double inputFieldHorizontalPadding = 30.0;

class RegisterWidget extends StatelessWidget {

  final mailController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var isChecked = false;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SquareGameAppBar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(
            inputFieldHorizontalPadding, 0, inputFieldHorizontalPadding, 0),
        child: SizedBox(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Créer un compte',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  DefaultInput(label: 'Email', validator: mailValidator, controller: mailController,),
                  DefaultInput(label: 'Identifiant', controller: loginController,),
                  DefaultInput(label: 'Mot de passe', isPassword: true, controller: passwordController,),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          isChecked = value!;
                        },
                      ),
                      const Text(
                        'J\'accepte les conditions d\'utilisation',
                        style: TextStyle(fontSize: 15, color: Colors.red),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        tryRegister();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Créer un compte'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? mailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer un email valide';
    }
    return null;
  }

  Future<void> tryRegister() async {
    var url = Uri.parse('http://172.22.114.67:8080/api/1/players');
    var response = await post(
      url,
      headers: setHeader(),
      body: setBody(),
      encoding: Encoding.getByName("utf-8"),
    );

    printResponseStatus(response);
  }

  String setBody() {
    return jsonEncode(<String, String>{
      "login": loginController.text,
      "password": passwordController.text,
      "email": mailController.text,
    });
  }

  Map<String, String> setHeader() {
    return <String, String>{
      'Content-Type': 'application/json',
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
