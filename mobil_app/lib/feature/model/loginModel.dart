class LoginModel {
  String? username;
  String? password;

  LoginModel({this.username, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['tokens'] = this.tokens;
    return data;
  }
}
