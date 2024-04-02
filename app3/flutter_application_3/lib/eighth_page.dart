import 'package:flutter/material.dart';

import 'ninth_page.dart';
import 'user_model.dart';

class EighthPage extends StatelessWidget {
  final UserModel user;
  final String activityLevel;
  final double bmi;

  EighthPage({Key? key, required this.user, required this.activityLevel, required this.bmi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eighth Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Calories Calculation Results',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('BMI: $bmi'),
            SizedBox(height: 10),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to NinthPage with the 'gain weight' objective
              Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => NinthPage(
      user: user, // Pass the UserModel object
      objective: 'Gain Weight', // Pass the objective string
      activityLevel: activityLevel, // Pass the activity level string
      bmi: bmi, // Pass the BMI value
    ),
  ),
);

              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Change primary to backgroundColor
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                'Gain Weight',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
  onPressed: () {
    // Navigate to NinthPage with the 'gain weight' objective
    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => NinthPage(
      user: user, // Pass the UserModel object
      objective: 'Lose Weight', // Pass the objective string
      activityLevel: activityLevel, // Pass the activity level string
      bmi: bmi, // Pass the BMI value
    ),
  ),
);

  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 241, 81, 7), // Change primary to backgroundColor
    onPrimary: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  ),
  child: Text(
    'Lose Weight',
    style: TextStyle(fontSize: 18),
  ),
),

          ],
        ),
      ),
    );
  }
}
