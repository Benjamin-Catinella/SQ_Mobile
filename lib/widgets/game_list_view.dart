import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sg_mobile/models/game_list_model.dart';

import '../services/game_list_service.dart';
import '../services/service_locator.dart';
import 'game_card.dart';
class GameListWidget extends StatefulWidget {
  const GameListWidget ({super.key});
  @override
  State<GameListWidget> createState() => _GameListWidget();
}

class _GameListWidget extends State<GameListWidget> {
  GameListModel gameListModel = GameListModel();
  List<Game> gameList = [];

  @override
  void initState() {
    super.initState();
    gameListModel.fetchGames().then((_) {
      setState(() {
        gameList = gameListModel.getGameList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (gameList != null)
          for (var game in gameList)
            GameCard(game)
      ],
    );
  }
}
