import 'package:flutter/material.dart';
import 'package:practical_task/signup.dart';
import 'package:practical_task/view.dart';
import 'dart:async';
import 'insert.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: ClipOval( // This will make the image circular
          child: Image.network(
            "https://www.the-miniproject.com/wp-content/uploads/2023/07/Logo-The-Mini-project.png",
            height: 200,  // Set the height of the image
            width: 200,   // Set the width of the image
            fit: BoxFit.cover, // Ensure the image scales correctly within the circle
          ),
        ),
      ),
    );
  }
}
