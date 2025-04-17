import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/loginModel.dart';
import 'package:mobil_app/feature/service/login_service.dart';
import 'package:mobil_app/feature/view/home_view.dart';
import 'package:mobil_app/feature/view/login_view.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginViewModel extends State<LoginView> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final Dio dio;
  late final ILoginService loginService;

  bool isLoading = false;
  String? token;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));
    emailController = TextEditingController();
    passwordController = TextEditingController();
    loginService = LoginService(dio);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginUser() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    final loginModel = LoginModel(
      username: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    try {
      final response = await loginService.login(loginModel);

      if (response != null && response.tokens != null) {
        print('TOKEN: ${response.tokens}');

        // ← TOKEN BURADA KAYDEDİLİYOR
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_token', response.tokens!);

        setState(() {
          token = response.tokens;
        });

        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
        }
      } else {
        setState(() {
          errorMessage = 'Giriş başarısız';
        });

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Kullanıcı adı veya şifre hatalı')),
          );
        }
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Hata oluştu: $e';
      });

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bir hata oluştu: $e')),
        );
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
