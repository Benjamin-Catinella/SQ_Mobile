import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sg_mobile/widgets/loading.dart';
import 'package:sg_mobile/widgets/square_game_app_bar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../model/register_dto.dart';
import '../service/authentication_service.dart';
import '../service/service_locator.dart';
import 'inputs.dart';

const double inputFieldHorizontalPadding = 30.0;

class RegisterWidget extends StatefulWidget {
  bool _loading;

  RegisterWidget({super.key}) : _loading = false;

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final authenticationService = getIt<AuthenticationService>();

  final mailController = TextEditingController();

  final loginController = TextEditingController();

  final passwordController = TextEditingController();

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
          child: Stack(
            children: [
              ListView(
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
                      DefaultInput(
                        label: 'Email',
                        validator: mailValidator,
                        controller: mailController,
                      ),
                      DefaultInput(
                        label: 'Identifiant',
                        controller: loginController,
                      ),
                      DefaultInput(
                        label: 'Mot de passe',
                        isPassword: true,
                        controller: passwordController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
              if (widget._loading) const LoadingCircle()
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

  RegisterDTO getRegisterDTO() {
    return RegisterDTO(
      email: mailController.text,
      login: loginController.text,
      password: passwordController.text,
    );
  }

  void tryRegister() async {
    setState(() {
      widget._loading = true;
    });

    var response = await authenticationService.register(getRegisterDTO());
    // simulate wait time
    await Future.delayed(const Duration(seconds: 2));
    if (response.statusCode == 200) {
      print("Register success");
    } else {
      print("Register failed");
    }

    setState(() {
      widget._loading = false;
    });
  }
}
