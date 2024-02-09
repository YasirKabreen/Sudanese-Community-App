import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sudanese_community/firebase_options.dart';
import 'package:sudanese_community/screens/Users.dart';
import 'package:sudanese_community/screens/signup.dart';
import 'package:sudanese_community/screens/user_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Users(),
    );
  }
}