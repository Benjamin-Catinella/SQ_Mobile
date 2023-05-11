import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
/*
responseBody:
[{"id":"6e7f1210-c1e8-4633-8cdb-b96efea6ea05","participation":"PENDING","participants":[{"id":"677623cf-3826-4ec5-b61b-bf5af26fd509","displayName":"677623cf-3826-4ec5-b61b-bf5af26fd509","participation":"ACCEPTED"},{"id":"c9550784-6c88-4653-9c68-f486a7dd1d39","displayName":"c9550784-6c88-4653-9c68-f486a7dd1d39","participation":"PENDING"}]}]

 */
class Partie {
  String id;
  // List<Participant> participants;
  // String participation;
  // List<Move> allowedMoves;
  // List<Token> placedTokens;
  // List<Token> remainingTokens;
  // List<Token> removedTokens;

  Partie({
    required this.id,
  //   required this.participation,
  //   required this.participants,
  //   required this.allowedMoves,
  //   required this.placedTokens,
  //   required this.remainingTokens,
  //   required this.removedTokens,
  });

}

class Token {
}

class Move {
}

class Participant {
  String id;
  String displayName;
  String participation;

  Participant({
    required this.id,
    required this.displayName,
    required this.participation,
  });
}

class PartieService {
  Future<List<Partie>> getParties() async {
    Uri url = Uri.parse('http://192.168.1.197:8080/api/1/games');

    Response response = await get(url, headers: await setHeader());

    if(response.statusCode == 200) {
      print(response.body);
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

    List gameJson = jsonDecode(responseBody) as List;
    List<Partie> gameList = gameJson.map((partie) => Partie(
      id: partie["id"],
      // TODO: deserialize the rest of the partie
      // participation: partie["participation"],
      // participants: partie["participants"],
      // allowedMoves: partie["allowedMoves"],
      // placedTokens: partie["placedTokens"],
      // remainingTokens: partie["remainingTokens"],
      // removedTokens: partie["removedTokens"],
    )).toList();
    return gameList;
  }

}
