class LoginDTO {
  String login;
  String password;

  LoginDTO({required this.login, required this.password});

  fromJson(Map<String, dynamic> json) {
    login = json['login'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() => {
        'login': login,
        'password': password,
      };
}