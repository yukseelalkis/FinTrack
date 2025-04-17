// abstract class ILoginDioService {
//   final Dio dio;
//   ILoginDioService(this.dio);
//   Future<TokenModel?> login(LoginModel model);z
//   final String _path = 'api/login';
// }

// // https://reqres.in/api/login

// class LoginDioService extends ILoginDioService {
//   LoginDioService(super.dio);

//   @override
//   Future<TokenModel?> login(LoginModel model) async {
//    //print(dio.options.baseUrl + _path);
//     final response = await dio.post(_path, data: model.toJson());
//     if (response.statusCode == HttpStatus.ok) {
//       return TokenModel.fromJson(response.data);
//     }
//     return null;
//   }
// }

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mobil_app/feature/model/loginModel.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);
  Future<TokenModel?> login(LoginModel model);
  final String _path = 'account/login';
}

class LoginService extends ILoginService {
  LoginService(super.dio);

  @override
  Future<TokenModel?> login(LoginModel model) async {
    final response = await dio.post(_path, data: model.toJson());
    if (response.statusCode == HttpStatus.ok) {
      return TokenModel.fromJson(response.data);
    }
    return null;
  }
}
