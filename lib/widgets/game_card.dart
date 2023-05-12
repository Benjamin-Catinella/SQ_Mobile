import 'package:flutter/material.dart';

import '../services/game_list_service.dart';
import 'game_detail.dart';

class GameCard extends StatelessWidget {
  final Game game;
  final List<Game> gameList;
  const GameCard(this.game, {Key? key, required this.gameList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameDetailsPage(game, gameList: gameList, initialIndex: gameList.indexWhere((g) => g.id == game.id)),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 20.0),
            child: Image(
              image: AssetImage(game.img),
              width: 70,
              height: 70,
            ),
          ),
          Text(
            game.label,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
    );
  }


}