class RegisterModel {
  String? userName;
  String? email;
  String? password;

  RegisterModel({this.userName, this.email, this.password});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
    };
  }
}
