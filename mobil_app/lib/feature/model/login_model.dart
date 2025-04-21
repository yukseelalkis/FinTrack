class LoginModel {
  String? username;
  String? password;

  LoginModel({this.username, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}

class TokenModel {
  String? userName;
  String? email;
  String? tokens;

  TokenModel({this.userName, this.email, this.tokens});

  TokenModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    tokens = json['tokens'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'tokens': tokens,
    };
  }
}
