import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hardik/UI1/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Get.off(() => login(), transition: Transition.upToDown);
    });

    return Scaffold(
      backgroundColor: const Color(0xFFDC8744), // Orange background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Flutter Logo

                Image.asset('assets/flutter2.png', height: 100),



             SizedBox(height: 30),

            // Text
            const Text(
              "FLUTTER APP",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
