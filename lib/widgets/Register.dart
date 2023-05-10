import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sg_mobile/widgets/SquareGameAppBar.dart';

import 'Inputs.dart';

const double inputFieldHorizontalPadding = 30.0;

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isChecked = false;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SquareGameAppBar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(
            inputFieldHorizontalPadding, 0, inputFieldHorizontalPadding, 0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
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
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(fontSize: 20, color: Colors.red),
                        textAlign: TextAlign.left,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer un email valide';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                DefaultInput(label: 'Identifiant'),
                DefaultInput(label: 'Mot de passe', isPassword: true),
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
                    onPressed: () {},
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
    );
  }
}
