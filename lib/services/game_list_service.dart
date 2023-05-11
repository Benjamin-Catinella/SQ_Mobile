import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GameFetch {
  final String id;
  final String label;

  GameFetch({
    required this.id,
    required this.label,
  });
}

class Game {
  final String id;
  final String label;
  final String img;
  final String description;

  Game({
    required this.id,
    required this.label,
    required this.img,
    required this.description,
  });
}

abstract class GameListService {
  late List<GameFetch> gameListFetched;

  Future<List<GameFetch>> fetchGameList();
  Future<Map<String, String>> setHeader();
  List<GameFetch> deserializeGameList(String responseBody);
}

class GameListServiceImpl extends GameListService {

  Future<List<GameFetch>> fetchGameList() async {
    var url = Uri.parse('http://localhost:8080/api/1/plugins');
    var response = await http.get(url, headers: await setHeader());
    if(response.statusCode == 200) {
      return deserializeGameList(response.body);
    } else {
      throw Exception('Failed to retrieve game list. Status code: ${response.statusCode}');
    }
  }

  Future<Map<String, String>> setHeader() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.get('token'));
    return { HttpHeaders.authorizationHeader: 'Bearer ${prefs.get('token')}' };
  }

  List<GameFetch> deserializeGameList(String responseBody) {
    var gameJson = jsonDecode(responseBody) as List;
    List<GameFetch> gameList = gameJson.map((jsonGame) => GameFetch (
      id: jsonGame["id"],
      label: jsonGame["label"],
    )).toList();
    return gameList;
  }
}