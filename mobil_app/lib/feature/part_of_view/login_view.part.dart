part of '../view/login_view.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/png/logo2.png',
              width: AppStyles.loginIconSize,
              height: AppStyles.loginIconSize,
            ),
            FadeInUp(
              duration: AppDuration.loginDuration,
              child: Text(
                ProjectItemsString.loginText,
                style: Theme.of(context).textTheme.headlineMedium,
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
  const _BodyColumn({
    required this.emailController,
    required this.passwordController,
    required this.myWidth,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final double myWidth;

  void _handleForgotPassword() {
    // Şifremi unuttum işlemleri
  }

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
                hintText: ProjectItemsString.userName,
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
          onTapCallback: _handleForgotPassword,
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: myWidth,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              final viewModel =
                  context.findAncestorStateOfType<LoginViewModel>();
              viewModel?.loginUser();
            },
            child: Text(
              ProjectItemsString.loginButtonText,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        const SizedBox(height: 30),
        CustomGestureText(
          text: ProjectItemsString.register,
          onTapCallback: () {
            NavigatorHelper.navigateToPage(context, AppRoute.register);
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
