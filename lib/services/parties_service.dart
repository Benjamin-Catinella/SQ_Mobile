import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

class Partie {
  String id;
  List<Participant> participants;
  List<Move> allowedMoves;
  List<Token> placedTokens;
  List<Token> remainingTokens;
  List<Token> removedTokens;

  Partie({
    required this.id,
    required this.participants,
    required this.allowedMoves,
    required this.placedTokens,
    required this.remainingTokens,
    required this.removedTokens,
  });

}

class Token {
}

class Move {
}

class Participant {
}

class PartieService {
  Future<List<Partie>> getParties() async {
    Uri url = Uri.parse('http://172.22.114.67:8080/api/1/games');

    Response response = await get(url, headers: await setHeader());

    if(response.statusCode == 200) {
      return deserializePartie(response.body);
    } else {
      throw Exception('Failed to retrieve game list. Status code: ${response.statusCode}');
    }

  }

  Future<Map<String, String>> setHeader() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      HttpHeaders.authorizationHeader: 'Bearer ${prefs.get('token')}'
    };
  }

  List<Partie> deserializePartie(String responseBody) {
    var gameJson = jsonDecode(responseBody) as List;
    List<Partie> gameList = gameJson.map((partie) => Partie(
      id: partie["id"],
      participants: partie["participants"],
      allowedMoves: partie["allowedMoves"],
      placedTokens: partie["placedTokens"],
      remainingTokens: partie["remainingTokens"],
      removedTokens: partie["removedTokens"],
    )).toList();
    return gameList;
  }

}
