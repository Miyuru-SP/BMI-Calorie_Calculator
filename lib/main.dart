import 'package:flutter/material.dart';
import 'package:medical_app/auth/loginScreen.dart';
import 'package:medical_app/bmiScreens/bmiScreen.dart';
import 'package:medical_app/calorieCalScreen/calorieNextScreen.dart';
import 'package:medical_app/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
        ),
        home: HomeScreen());
  }
}
