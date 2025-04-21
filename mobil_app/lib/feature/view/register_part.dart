part of 'register_view.dart';

class _RegisterHeader extends StatelessWidget {
  const _RegisterHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_add_alt,
              color: AppColors.greenColor,
              size: AppStyles.loginIconSize,
            ),
            const SizedBox(height: AppStyles.spacing10),
            FadeInUp(
              duration: AppDuration.loginDuration,
              child: Text(
                ProjectItemsString.register,
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
              ProjectItemsString.createAccount,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ],
    );
  }
}

class _RegisterBody extends StatelessWidget {
  const _RegisterBody(
      {required this.usernameController,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.myWidth,
      required this.registerService,
      required this.onRegister});

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final double myWidth;
  final RegisterService registerService;
  final Function onRegister;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: AppStyles.spacing10),
        FadeInUp(
          duration: AppDuration.loginTextField,
          child: Column(
            children: [
              CustomTextField(
                hintText: ProjectItemsString.userName,
                controller: usernameController,
              ),
              const SizedBox(height: AppStyles.spacing20),
              CustomTextField(
                hintText: ProjectItemsString.mailText,
                controller: emailController,
              ),
              const SizedBox(height: AppStyles.spacing20),
              CustomTextField(
                hintText: ProjectItemsString.passwordHintText,
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: AppStyles.spacing20),
              CustomTextField(
                hintText: ProjectItemsString.confirmPassword,
                obscureText: true,
                controller: confirmPasswordController,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppStyles.spacing30),
        SizedBox(
          width: myWidth,
          height: 50,
          child: ElevatedButton(
            onPressed: () => onRegister(context),
            child: Text(
              ProjectItemsString.register,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        const SizedBox(height: AppStyles.spacing10),
        CustomGestureText(
          text: ProjectItemsString.backToLogin,
          onTapCallback: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
