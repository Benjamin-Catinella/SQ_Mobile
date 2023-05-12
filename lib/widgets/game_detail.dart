import 'package:flutter/material.dart';

import '../services/game_list_service.dart';

class GameDetailsPage extends StatelessWidget {
  final Game game;

  GameDetailsPage({required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.label),
      ),
      body: ListView(
        children: <Widget>[
          Image(image: AssetImage(game.img)),
          Text(game.description),
          FilledButton(onPressed: onPressed, child: const Text('Filled')),
        ],
      ),
    );
  }

  void onPressed(){}
}
