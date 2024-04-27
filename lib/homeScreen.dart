import 'package:flutter/material.dart';
import 'package:medical_app/auth_helper.dart';
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
      appBar: AppBar(
        title: Text(
          "BODYFIT",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF202020),
        iconTheme: IconThemeData(color: Colors.white),
        leading: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ConfirmationDialog(
                  title: 'Logout Confirmation',
                  content: 'Are you sure you want to logout?',
                  confirmText: 'Yes, Logout',
                  cancelText: 'Cancel',
                  onConfirm: () {
                    // Perform the logout action here
                    AuthHelper.instance.logout(context);
                  },
                  onCancel: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                );
              },
            );
          },
          child: Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 16, 17, 29),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BottomContainer(
                text: 'BMI Calculator',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BMIScreen()));
                }),

            const SizedBox(height: 30),

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

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  ConfirmationDialog({
    required this.title,
    required this.content,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: onCancel,
          child: Text(cancelText),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(confirmText),
        ),
      ],
    );
  }
}
