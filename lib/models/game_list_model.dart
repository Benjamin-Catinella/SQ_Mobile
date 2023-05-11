import 'package:flutter/cupertino.dart';
import '../services/game_list_service.dart';
import '../services/service_locator.dart';

class GameListModel extends ChangeNotifier {
  Map<String, String> imageMap = {
    'Morpion': 'images/connexion_image-removebg-preview.png',
    'Taquin': 'images/connexion_image-removebg-preview.png',
    'Puissance 4': 'images/connexion_image-removebg-preview.png',
  };
  Map<String, String> descriptionMap = {
    'Morpion': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    'Taquin': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    'Puissance 4': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  };
  List<Game> gameList = [];
  final gameListService = getIt<GameListService>();

  Future<void> fetchGames() async {
    try{
      gameList = setGameList(await gameListService.fetchGameList());
      notifyListeners();
    } catch (e) {
      //TODO : TOASTR LOADING GAME LIST ERROR
      print('Failed to load games');
    }
  }

  List<Game>setGameList(List<GameFetch> list) {
    List<Game> gameList = [];
    for (var item in list) {
      gameList.add(setGame(item));
    }
    return gameList;
  }

  Game setGame(GameFetch item) {
    return Game(
      id: item.id,
      label: item.label,
      img: setImage(item.label),
      description: setDescription(item.label),
    );
  }

  String setImage(String gameName) {
    return imageMap[gameName] ?? '';
  }

  String setDescription(String gameName) {
    return descriptionMap[gameName] ?? '';
  }

  List<Game> getGameList() {
    return gameList;
  }
}