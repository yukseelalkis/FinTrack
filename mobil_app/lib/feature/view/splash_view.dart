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

              // Buton
              GestureDetector(
                onTap: () {
                  // burayi pushReplacement kullanmamiz gerek
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()));
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: myHeight * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(105, 195, 137, 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: myHeight * 0.025,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: myWidth * 0.03),
                      RotationTransition(
                        turns: const AlwaysStoppedAnimation(310 / 360),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          size: myHeight * 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
