import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:mobil_app/feature/view_model/login_view_model.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';
import 'package:mobil_app/product/utilitiy/duration/app_duration.dart';
import 'package:mobil_app/product/utilitiy/enum/app_routes.dart';
import 'package:mobil_app/product/utilitiy/helper/navigator_helper.dart';
import 'package:mobil_app/product/widget/custom_gesture.dart';
import 'package:mobil_app/product/widget/custom_text_field.dart';

part '../part_of_view/login_view.part.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: AppStyles.backgroundGradientBox,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: myHeight * 0.08),
                  const Padding(
                    padding: PagePadding.loginHeaderColumn(),
                    child: _Header(),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: myWidth * 0.9,
                    padding: const PagePadding.loginTextField(),
                    decoration: AppStyles.loginDecoration,
                    child: _BodyColumn(
                      emailController: emailController,
                      passwordController: passwordController,
                      myWidth: myWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
