import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/widgets/button.dart';
import 'package:medical_app/widgets/const.dart';

class BMIResultScreen extends StatelessWidget {
  final String resultText;
  final String bmi;
  final String advise;
  final Color textColor;

  BMIResultScreen({
    required this.textColor,
    required this.resultText,
    required this.bmi,
    required this.advise,
  });

  Future<void> _saveResultToFirestore() async {
    try {
      // Initialize Cloud Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Add document to a collection (assuming you have a collection named 'bmi_results')
      await firestore.collection('bmi_results').add({
        'result_text': resultText,
        'bmi': bmi,
        'advise': advise,
        'timestamp': DateTime.now(), // You can add a timestamp if needed
      });

      print('BMI result saved to Firestore');
    } catch (error) {
      print('Error saving BMI result: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF202020),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color.fromARGB(255, 16, 17, 29),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Your Result',
                style: ktitleTextStyle.copyWith(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableBg(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmi,
                    style: kBMITextStyle.copyWith(color: Colors.white),
                  ),
                  Text(
                    'Normal BMI range:',
                    style: klabelTextStyle.copyWith(color: Colors.white),
                  ),
                  Text(
                    '18.5 - 25 kg/m2',
                    style: klabelTextStyle.copyWith(color: Colors.white),
                  ),
                  Text(
                    advise,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(
            text: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
