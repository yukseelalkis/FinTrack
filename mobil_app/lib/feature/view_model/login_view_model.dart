import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobil_app/feature/model/login_model.dart';
import 'package:mobil_app/feature/service/login_service.dart';
import 'package:mobil_app/feature/view/home_view.dart';
import 'package:mobil_app/feature/view/login_view.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';
import 'package:mobil_app/product/utilitiy/helper/snackbar_helper.dart';
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
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_token', response.tokens!);

        final decodedToken = JwtDecoder.decode(response.tokens!);
        print("Decoded Token: $decodedToken"); // ← EKLE

        final userName = decodedToken['given_name'] ??
            decodedToken['username'] ??
            decodedToken['name'] ??
            decodedToken['sub'];

        if (userName != null && userName is String) {
          await prefs.setString('username', userName);
        }

        setState(() {
          token = response.tokens;
        });

        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
      } else {
        setState(() {
          errorMessage = ProjectItemsString.loginFailed;
        });

        if (!mounted) return;
        SnackbarHelper.showError(
            context, ProjectItemsString.invalidCredentials);
      }
    } catch (e) {
      setState(() {
        errorMessage = '${ProjectItemsString.loginError}: $e';
      });

      if (!mounted) return;
      SnackbarHelper.showError(context, '${ProjectItemsString.loginError}: $e');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
