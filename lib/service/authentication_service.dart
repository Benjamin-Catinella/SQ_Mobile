import 'dart:convert';

import 'package:http/http.dart';

abstract class AuthenticationService {
  Future<Response> login(String login, String password);
  Future<Response> register(String login, String password, String email);
}

class AuthenticationServiceImpl extends AuthenticationService {

  String setBody(Object object) {
    return jsonEncode(object);
  }

  Map<String, String> setHeader() {
    return <String, String>{
      'Content-Type': 'application/json',
    };
  }

  void printResponseStatus(response) {
    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } else {
      //TODO: TOASTR MESSAGE
      throw Exception('Failed to create session.');
    }
  }

  @override
  Future<Response> login(String login, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Response> register(String login, String password, String email) {
    // TODO: implement register
    throw UnimplementedError();
  }
}