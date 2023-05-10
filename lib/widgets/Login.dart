import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sg_mobile/widgets/Inputs.dart';
import 'package:sg_mobile/widgets/Register.dart';

import 'SquareGameAppBar.dart';

const double inputFieldHorizontalPadding = 30.0;

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SquareGameAppBar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(
            inputFieldHorizontalPadding, 0, inputFieldHorizontalPadding, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
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
            DefaultInput(label: 'Identifiant'),
            DefaultInput(label: 'Mot de passe', isPassword: true),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
