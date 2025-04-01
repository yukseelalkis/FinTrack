part of '../view/splash_view.dart';

/// Sayfadaki Splash gorunum m
class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.5,
      child: LottieName(name: LottieItems.splash.name),
    );
  }
}

/// textlerim
class _TextColumn extends StatelessWidget {
  const _TextColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.bottomXL(),
      child: Column(
        children: [
          Text(
            ProjectItemsString.splashTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.height * 0.025),
          Text(
            ProjectItemsString.splashSub,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: context.height * 0.025,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
