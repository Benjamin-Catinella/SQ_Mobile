import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double inputFieldHorizontalPadding = 30.0;

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Identifiant',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                  textAlign: TextAlign.left,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Identifiant',
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Mot de passe',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Identifiant',
                  ),
                ),
              ],
            ),
          ),
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
}
