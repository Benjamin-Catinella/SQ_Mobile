import 'dart:convert';

import 'package:http/http.dart';
import 'package:sg_mobile/model/login_dto.dart';
import 'package:sg_mobile/model/register_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthenticationService {
  Future<bool>  login(LoginDTO loginDTO);
  Future<bool>  register(RegisterDTO registerDTO);
  Future<bool>  logout();
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
  Future<bool> login(LoginDTO loginDTO) async {
    var url = Uri.parse('http://172.22.114.67:8080/api/1/sessions');
    final prefs = await SharedPreferences.getInstance();

    Response response = await post(
      url,
      headers: setHeader(),
      body: setBody(loginDTO),
    );

    if (response.statusCode == 200) {
      // Save the token in the local storage
      await prefs.setString('token', jsonDecode(response.body)['accessToken']);
      print("successfully logged in");
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isLogged() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      return token;
    } else {
      throw Exception('No token found');
    }
  }

  @override
  Future<bool> register(RegisterDTO registerDTO) async {
    var url = Uri.parse('http://172.22.114.67:8080/api/1/players');

    Response response = await post(
      url,
      headers: setHeader(),
      body: setBody(registerDTO),
    );

    if (response.statusCode == 200) {
      LoginDTO loginDTO =
          LoginDTO(login: registerDTO.login, password: registerDTO.password);
      return await login(loginDTO);
    } else {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    return true;
  }
}
