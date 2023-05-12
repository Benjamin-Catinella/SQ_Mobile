import 'package:flutter/material.dart';

import '../services/game_list_service.dart';

class GameDetailsPage extends StatelessWidget {
  final List<Game> gameList;
  final int initialIndex;

  GameDetailsPage(Game game, {required this.gameList, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: gameList.length,
      controller: PageController(initialPage: initialIndex),
      itemBuilder: (context, index) {
        var game = gameList[index];
        return Scaffold(
          appBar: AppBar(
            title: Text(game.label),
            backgroundColor: Colors.red,
          ),
          body: ListView(
            children: <Widget>[
              Image(image: AssetImage(game.img)),
              Text(game.description),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {},
                child: const Text('Jouer', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }
}
