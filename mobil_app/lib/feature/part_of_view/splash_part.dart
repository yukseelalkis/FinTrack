part of '../view/splash_view.dart';

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

class _TextColumn extends StatelessWidget {
  const _TextColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ProjectItemsString.splashTitle,
          style: TextStyle(
            fontSize: context.height * 0.045,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: context.height * 0.015),
        Text(
          ProjectItemsString.splashSub,
          style: TextStyle(
            fontSize: context.height * 0.025,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
