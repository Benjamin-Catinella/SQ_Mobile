import 'package:flutter/cupertino.dart';
import '../services/game_list_service.dart';

class GameListModel extends ChangeNotifier {
  List<Game> gameList = [];
  final GameListService gameListService;
  GameListModel({required this.gameListService});

  Future<void> fetchGames() async {
    try{
      gameList = await gameListService.fetchGameList();
      notifyListeners();
    } catch (e) {
      //TODO : TOASTR LOADING GAME LIST ERROR
      print('Failed to load games');
    }
  }


}