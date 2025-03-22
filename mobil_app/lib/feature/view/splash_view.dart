import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobil_app/feature/view/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: myWidth * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Lottie Animasyonu
              SizedBox(
                height: myHeight * 0.4,
                child: Lottie.asset('assets/lottie/splash.json'),
              ),

              // Yazılar
              Column(
                children: [
                  Text(
                    'Yatırımlarınızı Yönetin',
                    style: TextStyle(
                      fontSize: myHeight * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: myHeight * 0.015),
                  Text(
                    'Hisse senetlerinden kripto paralara, yatırım fırsatlarını keşfedin ve geleceğe FinTrack ile güvenle bakın.',
                    style: TextStyle(
                      fontSize: myHeight * 0.025,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
