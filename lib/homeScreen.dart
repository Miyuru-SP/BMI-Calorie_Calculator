import 'package:flutter/material.dart';
import 'package:medical_app/bmiScreens/bmiScreen.dart';
import 'package:medical_app/calorieCalScreen/calorieCalScreen.dart';
import 'package:medical_app/widgets/button.dart';
// import 'package:medical_app/auth/authService.dart';
// import 'package:medical_app/auth/loginScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final auth = AuthService();
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome User",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),

            BottomContainer(
                text: 'BMI Calculator',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BMIScreen()));
                }),

            const SizedBox(height: 20),

            BottomContainer(
                text: 'Calory Calculator',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalorieCalculateScreen()));
                }),

            // CustomButton(
            //   label: "Sign Out",
            //   onPressed: () async {
            //     await auth.signout();
            //     goToLogin(context);
            //   },
            // )
          ],
        ),
      ),
    );
  }

  // goToLogin(BuildContext context) => Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const LoginScreen()),
  //     );
}
