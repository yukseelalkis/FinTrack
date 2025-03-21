import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: myHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 30, 92, 148),
              Color.fromARGB(255, 41, 114, 182),
              Color.fromARGB(255, 92, 155, 210),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: myHeight * 0.08),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: const Text("Login",
                        style: TextStyle(color: Colors.white, fontSize: 36)),
                  ),
                  const SizedBox(height: 10),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1300),
                    child: const Text("Welcome Back",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: myWidth * 0.9,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 20), // alt boşluğu azalttık
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 1400),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 15,
                              offset: const Offset(0, 5)),
                        ],
                      ),
                      child: Column(
                        children: const [
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Email or Phone",
                              border: InputBorder.none,
                            ),
                          ),
                          Divider(),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text("Forgot Password?",
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: myWidth,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(41, 114, 182, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text("Continue with social media",
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            minimumSize: const Size(0, 45),
                          ),
                          child: Text("Facebook",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(245, 106, 72,  1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            minimumSize: const Size(0, 45),
                          ),
                          child: Text(
                            "Google",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(), // Arka plan rengini sabit yukarı itiyor
          ],
        ),
      ),
    );
  }
}
