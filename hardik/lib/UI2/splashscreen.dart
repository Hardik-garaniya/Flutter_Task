import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';

class Splshscreen2 extends StatefulWidget {
  const Splshscreen2({super.key});

  @override
  State<Splshscreen2> createState() => _Splshscreen2State();
}

class _Splshscreen2State extends State<Splshscreen2> {
  @override
  void initState() {
    super.initState();

    // Start timer in initState
    Timer(const Duration(seconds: 5), () {
      Get.off(() =>  login2(), transition: Transition.downToUp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              'Food Delivery',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}




// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hardik/UI1/login.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Timer(const Duration(seconds: 5), () {
//       Get.off(() => login(), transition: Transition.upToDown);
//     });
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFDC8744), // Orange background
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Flutter Logo
//
//             Image.asset('assets/flutter2.png', height: 100),
//
//
//
//             SizedBox(height: 30),
//
//             // Text
//             const Text(
//               "FLUTTER APP",
//               style: TextStyle(
//                 fontSize: 26,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//                 letterSpacing: 2,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
