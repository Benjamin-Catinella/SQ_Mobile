class RegisterDTO {
  String login;
  String password;
  String email;
  String? displayName;

  RegisterDTO(
      {required this.login,
      required this.password,
      required this.email,
      this.displayName});

  fromJson(Map<String, dynamic> json) {
    login = json['login'];
    password = json['password'];
    email = json['email'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() => {
        'login': login,
        'password': password,
        'email': email,
        'displayName': displayName,
  };
}
