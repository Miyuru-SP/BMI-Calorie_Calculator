import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/bmiScreens/bmiCalculation.dart';
import 'package:medical_app/bmiScreens/bmiResult.dart';
import 'package:medical_app/widgets/button.dart';
import 'package:medical_app/widgets/const.dart';
import 'package:medical_app/widgets/iconContent.dart';
import 'package:flutter/cupertino.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

//ENUMERATION : The action of establishing number of something , implicit way
enum Gender {
  male,
  female,
}

class _BMIScreenState extends State<BMIScreen> {
  //by default male will be selected

  late Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 50;
  int age = 20;
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                        print(selectedGender);
                      });
                    },
                    child: ReusableBg(
                      colour: selectedGender == Gender.male
                          ? kinactiveCardColor
                          : kactiveCardColor,
                      cardChild: IconContent(
                        myicon: Icons.male,
                        text: 'MALE',
                        iconColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                        print(selectedGender);
                      });
                    },
                    child: ReusableBg(
                      colour: selectedGender == Gender.female
                          ? kinactiveCardColor
                          : kactiveCardColor,
                      cardChild: IconContent(
                        myicon: Icons.female,
                        text: 'FEMALE',
                        iconColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableBg(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kDigitTextStyle.copyWith(color: Colors.white),
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: ksliderInactiveColor,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 35.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableBg(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style:
                                  kDigitTextStyle.copyWith(color: Colors.white),
                            ),
                            Text(
                              'kg',
                              style: klabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.chevron_left_rounded,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: Icons.chevron_right,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableBg(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style:
                                  kDigitTextStyle.copyWith(color: Colors.white),
                            ),
                            Text(
                              'y',
                              style: klabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.chevron_left_rounded,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 15.0),
                            RoundIconButton(
                              icon: Icons.chevron_right_rounded,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomContainer(
            text: 'CALCULATE',
            onTap: () async {
              // Get the current user's UID
              String uid = FirebaseAuth.instance.currentUser!.uid;

              // Calculate the BMI
              Calculate calc = Calculate(height: height, weight: weight);
              String bmi = calc.result();
              String resultText = calc.getText();
              String advise = calc.getAdvise();
              Color textColor = calc.getTextColor();

              // Save the data to Firestore
              await FirebaseFirestore.instance.collection('bmi_results').add({
                'user_id': uid,
                'gender': selectedGender == Gender.male ? 'Male' : 'Female',
                'height': height,
                'weight': weight,
                'age': age,
                'bmi': bmi,
                'result_text': resultText,
                'advise': advise,
                'timestamp':
                    DateTime.now(), // You can add a timestamp if needed
              });

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BMIResultScreen(
                    bmi: bmi,
                    resultText: resultText,
                    advise: advise,
                    textColor: textColor,
                  ),
                ),
              );
            },
          )
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(
      //     Icons.favorite,
      //     color: Colors.pink,
      //     size: 23.0,
      //   ),
      //   backgroundColor: kactiveCardColor,
      // ),
    );
  }
}
