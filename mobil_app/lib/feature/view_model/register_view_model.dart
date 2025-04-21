import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/register_model.dart';
import 'package:mobil_app/feature/service/regsiter_service.dart';
import 'package:mobil_app/feature/view/register_view.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/enum/app_routes.dart';
import 'package:mobil_app/product/utilitiy/enum/service_enum.dart';
import 'package:mobil_app/product/utilitiy/helper/navigator_helper.dart';
import 'package:mobil_app/product/utilitiy/helper/snackbar_helper.dart';

abstract class RegsiterViewModel extends State<RegisterView> {
  late final Dio dio;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  late final RegisterService registerService;
  @override
  void initState() {
    dio = Dio(BaseOptions(baseUrl: ServicePath.baseUrl.path));

    super.initState();
    registerService = RegisterService(dio);
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  //// register islmeleri
  void onRegister(BuildContext context) async {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

    if (!emailRegex.hasMatch(email)) {
      SnackbarHelper.showError(context, ProjectItemsString.errorMail);
      return;
    }

    if (password != confirmPassword) {
      SnackbarHelper.showError(context, ProjectItemsString.passwordNotMatch);
      return;
    }

    if (password.length < 8) {
      SnackbarHelper.showError(context, ProjectItemsString.passwordRequirement);
      return;
    }

    final model = RegisterModel(
        userName: username, email: email, password: confirmPassword);

    try {
      final response = await registerService.register(model);
      if (response != null) {
        SnackbarHelper.showSuccess(context, ProjectItemsString.registerSuccess);
        NavigatorHelper.navigateToPage(context, AppRoute.login);
      } else {
        SnackbarHelper.showError(context, ProjectItemsString.errorSession);
      }
    } catch (e) {
      SnackbarHelper.showError(context, 'Hata oluştu: \$e');
    }
  }
}
