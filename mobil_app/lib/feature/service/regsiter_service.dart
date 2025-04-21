import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mobil_app/feature/model/register_model.dart';

abstract class IRegisterService {
  final Dio dio;
  IRegisterService(this.dio);
  final String _path = 'account/register';

  Future<RegisterModel?> register(RegisterModel model);
}

class RegisterService extends IRegisterService {
  RegisterService(super.dio);

  @override
  Future<RegisterModel?> register(RegisterModel model) async {
    final response = await dio.post(_path, data: model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return RegisterModel.fromJson(response.data);
    }
    return null;
  }
}



// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:mobil_app/feature/model/login_model.dart';

// abstract class ILoginService {
//   final Dio dio;

//   ILoginService(this.dio);
//   Future<TokenModel?> login(LoginModel model);
//   final String _path = 'account/login';
// }

// class LoginService extends ILoginService {
//   LoginService(super.dio);

//   @override
//   Future<TokenModel?> login(LoginModel model) async {
//     final response = await dio.post(_path, data: model.toJson());
//     if (response.statusCode == HttpStatus.ok) {
//       return TokenModel.fromJson(response.data);
//     }
//     return null;
//   }
// }
