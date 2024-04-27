import 'package:flutter/material.dart';
import 'package:medical_app/calorieCalScreen/calculate.dart';
import 'package:medical_app/calorieCalScreen/result.dart';
import 'package:medical_app/widgets/const.dart';

const Color inactiveCard = Color(0xFF202020);
var exerciseList = [
  "Little to no exercise",
  "Light exercise (1–3 days per week)",
  "Moderate exercise (3–5 days per week)",
  "Heavy exercise (6–7 days per week)",
  "Very heavy exercise (twice per day)"
];
var goalList = [
  "Maintain current weight",
  "Lose 0.5kg per week",
  "Lose 1kg per week",
  "Gain 0.5kg per week",
  "Gain 1kg per week"
];

class CalorieNextScreen extends StatefulWidget {
  final int height, weight, age;
  final String gender;

  const CalorieNextScreen(
      {required this.height,
      required this.weight,
      required this.age,
      required this.gender});

  @override
  State<CalorieNextScreen> createState() => _CalorieNextScreenState();
}

class _CalorieNextScreenState extends State<CalorieNextScreen> {
  String _activity = exerciseList[0];
  String _goal = goalList[0];
  late int height, weight, age;
  late String gender;

  @override
  void initState() {
    height = widget.height;
    weight = widget.weight;
    age = widget.age;
    gender = widget.gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calorie Meter"),
        centerTitle: true,
        backgroundColor: Color(0xFF202020),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                color: inactiveCard,
                card: Column(
                  children: <Widget>[
                    Text(
                      "Exercise Scale",
                      style: klabelTextStyle,
                    ),
                    ListTile(
                      title: Text(
                        exerciseList[0],
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Radio(
                        value: exerciseList[0],
                        groupValue: _activity,
                        onChanged: (String? value) {
                          setState(() {
                            _activity = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        exerciseList[2],
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Radio(
                        value: exerciseList[2],
                        groupValue: _activity,
                        onChanged: (String? value) {
                          setState(() {
                            _activity = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        exerciseList[3],
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Radio(
                        value: exerciseList[3],
                        groupValue: _activity,
                        onChanged: (String? value) {
                          setState(() {
                            _activity = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        exerciseList[4],
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Radio(
                        value: exerciseList[4],
                        groupValue: _activity,
                        onChanged: (String? value) {
                          setState(() {
                            _activity = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: inactiveCard,
                card: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Calorie Goal",
                      style: klabelTextStyle,
                    ),
                    ListTile(
                      title: Text(
                        goalList[0],
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Radio(
                        value: goalList[0],
                        groupValue: _goal,
                        onChanged: (String? value) {
                          setState(() {
                            _activity = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        goalList[1],
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Radio(
                        value: goalList[1],
                        groupValue: _goal,
                        onChanged: (String? value) {
                          setState(() {
                            _activity = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        goalList[2],
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Radio(
                        value: goalList[2],
                        groupValue: _goal,
                        onChanged: (String? value) {
                          setState(() {
                            _activity = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        goalList[3],
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Radio(
                        value: goalList[3],
                        groupValue: _goal,
                        onChanged: (String? value) {
                          setState(() {
                            _activity = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        goalList[4],
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Radio(
                        value: goalList[4],
                        groupValue: _goal,
                        onChanged: (String? value) {
                          setState(() {
                            _activity = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ButtonTheme(
              minWidth: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 7),
              child: FlatButton(
                color: Color(0xffbb86fc),
                text: "Calculate",
                onPressed: () {
                  CalculateCal c = CalculateCal(
                      height: widget.height,
                      weight: widget.weight,
                      age: age,
                      gender: gender,
                      goal: _goal,
                      activity: _activity);
                  c.calculateBMI();
                  c.calculateBMR();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(
                        status: c.getResult(),
                        msg: c.getInterpretation(),
                        statusNumber: c.calculateBMI(),
                        currentCalorie: c.getActivity(),
                        goalCalorie: c.getGoal(),
                        bmr: c.calculateBMR(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlatButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const FlatButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
