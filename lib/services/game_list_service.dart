import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Game {
  final String id;
  final String label;

  Game({
    required this.id,
    required this.label,
  });
}

class GameListService {

  Future<List<Game>> fetchGameList() async {
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
    return { HttpHeaders.authorizationHeader: 'Bearer ${prefs.get('token')}' };
  }

  List<Game> deserializeGameList(String responseBody) {
    var gameJson = jsonDecode(responseBody) as List;
    List<Game> gameList = gameJson.map((jsonGame) => Game (
      id: jsonGame["id"],
      label: jsonGame["label"],
    )).toList();
    return gameList;
  }
}