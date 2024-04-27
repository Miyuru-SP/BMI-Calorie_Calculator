import 'package:medical_app/colors.dart';
import 'package:medical_app/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/startScreen.dart';
import 'package:medical_app/homeScreen.dart';
import 'package:medical_app/widgets/const.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDGT7_OARq6UiuriBFlcc5uluYLI6t2e4g",
          appId: "1:454073212600:android:d77b3a81fad7121d9c5e4d",
          messagingSenderId: "454073212600",
          projectId: "medicalapplication-608e0"));
  // Initialize uni_links

  //..........when the user once logged in, he directly moves to home
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  //........
  final bool isLoggedIn;
  const MyApp({required this.isLoggedIn});
  //'''''''
  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BodyFit',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: isLoggedIn ? HomeScreen() : StartScreen());
  }
}
