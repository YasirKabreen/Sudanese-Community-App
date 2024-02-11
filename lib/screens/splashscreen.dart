import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sudanese_community/screens/auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the main app screen after a delay
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const Auth()), // Replace HomeScreen with your main app screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'lib/assets/KFU.jpg'), // Replace with your splash screen image
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Center(
          child: CircularProgressIndicator(), // Optional: Add loading indicator
        ),
      ),
    );
  }
}
