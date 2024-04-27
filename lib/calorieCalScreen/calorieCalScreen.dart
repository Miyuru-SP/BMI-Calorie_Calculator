import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/calorieCalScreen/calorieNextScreen.dart';
import 'package:medical_app/calorieCalScreen/imageTextCard.dart';
import 'package:medical_app/widgets/button.dart';
import 'package:medical_app/widgets/const.dart';

const Color inactiveCard = Color(0xFF1D1E33);
const Color activeCard = Color.fromARGB(255, 36, 39, 77);

class CalorieCalculateScreen extends StatefulWidget {
  const CalorieCalculateScreen({super.key});

  @override
  State<CalorieCalculateScreen> createState() => _CalorieCalculateScreenState();
}

enum Gender {
  male,
  female,
}

class _CalorieCalculateScreenState extends State<CalorieCalculateScreen> {
  Color maleCard = inactiveCard, femaleCard = inactiveCard;
  int height = 160, weight = 50, age = 20;
  String gender = "";
  void updateGenderSelected(int x) {
    if (x == 1) {
      gender = "Male";
      maleCard = activeCard;
      femaleCard = inactiveCard;
    } else {
      gender = "Female";
      maleCard = inactiveCard;
      femaleCard = activeCard;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CALORIE CALCULATOR",
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
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              print("MALE");
                              updateGenderSelected(1);
                            });
                          },
                          child: ReusableCard(
                            color: maleCard,
                            card: ImageTextCard(
                              text: "MALE",
                              icon: FontAwesomeIcons.mars,
                              iconColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              print("FEMALE");
                              updateGenderSelected(2);
                            });
                          },
                          child: ReusableCard(
                            color: femaleCard,
                            card: ImageTextCard(
                              text: 'FEMALE',
                              icon: FontAwesomeIcons.venus,
                              iconColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
          ButtonTheme(
            minWidth: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 7),
            child: FlatButton(
              color: Color(0xFFEB1555),
              text: "Next",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalorieNextScreen(
                      height: height,
                      weight: weight,
                      gender: gender,
                      age: age,
                    ),
                  ),
                );
              },
            ),
          ),
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
