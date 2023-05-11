import 'dart:convert';

import 'package:http/http.dart';
import 'package:sg_mobile/model/login_dto.dart';
import 'package:sg_mobile/model/register_dto.dart';

abstract class AuthenticationService {
  Future<Response> login(LoginDTO loginDTO);
  Future<Response> register(RegisterDTO registerDTO);
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
      throw Exception('Failed to create session.');
    }
  }

  @override
  Future<Response> login(LoginDTO loginDTO) async {
    var url = Uri.parse('http://172.22.114.67:8080/api/1/sessions');

    return post(
      url,
      headers: setHeader(),
      body: setBody(loginDTO),
    );
  }

  @override
  Future<Response> register(RegisterDTO registerDTO) {
    var url = Uri.parse('http://172.22.114.67:8080/api/1/players');

    return post(
      url,
      headers: setHeader(),
      body: setBody(registerDTO),
    );
  }
}