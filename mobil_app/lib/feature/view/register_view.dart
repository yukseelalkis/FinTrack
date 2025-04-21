import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:mobil_app/feature/service/regsiter_service.dart';
import 'package:mobil_app/feature/view_model/register_view_model.dart';
import 'package:mobil_app/product/init/language/project_items_string.dart';
import 'package:mobil_app/product/utilitiy/constant/app_colors.dart';
import 'package:mobil_app/product/utilitiy/constant/app_padding.dart';
import 'package:mobil_app/product/utilitiy/constant/app_style.dart';
import 'package:mobil_app/product/utilitiy/duration/app_duration.dart';
import 'package:mobil_app/product/widget/custom_gesture.dart';
import 'package:mobil_app/product/widget/custom_text_field.dart';

part 'register_part.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends RegsiterViewModel {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: AppStyles.backgroundGradientBox,
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: myHeight * 0.05),
                    const Padding(
                      padding: PagePadding.loginHeaderColumn(),
                      child: _RegisterHeader(),
                    ),
                    const SizedBox(height: AppStyles.spacing20),
                    Container(
                      width: myWidth * 0.85,
                      padding: const PagePadding.loginTextField(),
                      decoration: AppStyles.loginDecoration,
                      child: _RegisterBody(
                        onRegister: onRegister,
                        usernameController: usernameController,
                        emailController: emailController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        myWidth: myWidth,
                        registerService: registerService,
                      ),
                    ),
                    const SizedBox(height: AppStyles.spacing20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
