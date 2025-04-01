part of '../view/login_view.dart';

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_balance_wallet_outlined,
              color: AppColors.greenColor,
              size: AppStyles.loginIconSize,
            ),
            const SizedBox(width: 10),
            FadeInUp(
              duration: AppDuration.loginDuration,
              child: Text(
                ProjectItemsString.loginText,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ],
        ),
        Padding(
          padding: const PagePadding.all(),
          child: FadeInUp(
            duration: AppDuration.loginWelcomeDuration,
            child: Text(
              ProjectItemsString.welcomeBack,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ],
    );
  }
}

class _BodyColumn extends StatelessWidget {
  void _handleForgotPassword() {
    // Şifremi unuttum işlemleri buraya
  }
  void _register() {
    // Şifremi unuttum işlemleri buraya
  }
  const _BodyColumn({
    required this.emailController,
    required this.passwordController,
    required this.myWidth,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final double myWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        FadeInUp(
          duration: AppDuration.loginTextField,
          child: Column(
            children: [
              CustomTextField(
                hintText: ProjectItemsString.emailHintText,
                controller: emailController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: ProjectItemsString.passwordHintText,
                obscureText: true,
                controller: passwordController,
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        CustomGestureText(
            text: ProjectItemsString.fotgotPassword,
            onTapCallback: _handleForgotPassword),
        const SizedBox(height: 30),
        SizedBox(
          width: myWidth,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(ProjectItemsString.loginText,
                style: Theme.of(context).textTheme.headlineSmall),
          ),
        ),
        const SizedBox(height: 30),
        CustomGestureText(
            text: ProjectItemsString.register, onTapCallback: _register),
        const SizedBox(height: 10),
      ],
    );
  }
}
