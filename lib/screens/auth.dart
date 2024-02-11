import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sudanese_community/screens/home.dart';

import 'package:sudanese_community/screens/signin.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Loading indicator while checking authentication status
        } else if (snapshot.hasData && snapshot.data != null) {
          // User is logged in, navigate to home screen
          return HomeScreen();
        } else {
          // User is not logged in, navigate to login screen
          return SignInScreen();
        }
      },
    );
  }
}
