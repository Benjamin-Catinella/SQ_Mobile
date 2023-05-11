import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sg_mobile/widgets/inputs.dart';
import 'package:sg_mobile/widgets/register.dart';
import 'package:sg_mobile/widgets/square_game_app_bar.dart';

import '../model/login_dto.dart';
import '../services/authentication_service.dart';
import '../services/service_locator.dart';
import 'loading.dart';


const double inputFieldHorizontalPadding = 30.0;

class LoginWidget extends StatefulWidget {
  bool _loading;

  LoginWidget({super.key}) : _loading = false;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final loginController = TextEditingController();

  final passwordController = TextEditingController();

  final authenticationService = getIt<AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(inputFieldHorizontalPadding, 0, inputFieldHorizontalPadding, 0),
      child: Stack(
        children: [
          ListView(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Image(
                      image: AssetImage(
                          'images/connexion_image-removebg-preview.png'),
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
              DefaultInput(label: 'Identifiant', controller: loginController),
              DefaultInput(label: 'Mot de passe', isPassword: true, controller: passwordController),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final navigator = Navigator.of(context);
                    if(await tryLogin()) {
                      navigator.pushNamedAndRemoveUntil('/home', (route) => false);
                    }
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterWidget()
                        ),
                      );
                    },
                    child: const Text(
                      "Inscription",
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    ),
                  )
                ],
              ),
            ],
          ),
          if (widget._loading) const LoadingCircle(),
        ],
      ),
    );
  }

  Future<bool> tryLogin() async {
    setState(() {
      widget._loading = true;
    });

    LoginDTO loginDTO = LoginDTO(
        login: loginController.text,
        password: passwordController.text
    );

    bool success = await authenticationService.login(loginDTO);

    setState(() {
      widget._loading = false;
    });
    return success;
  }
}

class TemporaryPage extends StatelessWidget {
  const TemporaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Temporary page'),
      ),
    );
  }
}
