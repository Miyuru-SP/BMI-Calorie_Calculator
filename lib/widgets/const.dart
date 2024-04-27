import 'package:flutter/material.dart';

//for BMI
class ReusableBg extends StatelessWidget {
  // ignore: non_constant_identifier_names
  ReusableBg({required this.colour, required this.cardChild}); //remove required
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

//for Calorie Cal
class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget card;

  ReusableCard({required this.color, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: card,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

const kactiveCardColor = Color(0xFF1D1E33);
const kinactiveCardColor = Color(0xFF111328);
const ksliderInactiveColor = Color(0xFF8D8E98);
const kbottomContainerHeight = 80.0;
const kbottomContainerColor = Color(0xFFEB1555);
const klabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);
const kDigitTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);
const klargeBottomButtonTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 25.0,
);
const ktitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);
const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 27.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);
const kBodyTextStyle = TextStyle(
  fontSize: 22,
);
