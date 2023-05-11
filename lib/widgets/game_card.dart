import 'package:flutter/material.dart';

import '../services/game_list_service.dart';

class GameCard extends StatelessWidget {
  final Game game;
  const GameCard(this.game, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        game.label
      ),
    );
  }

}