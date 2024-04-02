import 'package:flutter/material.dart';

import 'user_model.dart';

class SeventhPage extends StatelessWidget {
  final UserModel user;
  final String activityLevel;
  final double bmi;
  final String objective;

  const SeventhPage({
    Key? key,
    required this.user,
    required this.activityLevel,
    required this.bmi,
    required this.objective,
  }) : super(key: key);

  double calculateBMR() {
    double weight = user.weight ?? 0.0;
    double height = user.height ?? 0.0;
    double age = user.age ?? 0;

    if (user.gender == 'man') {
      return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }
  }

  double calculateTDEE(double bmr) {
    switch (activityLevel) {
      case 'Sedentary (little or no exercise)':
        return bmr * 1.2;
      case 'Lightly active (light exercise 1-3 days per week)':
        return bmr * 1.375;
      case 'Moderately active (moderate exercise 3-5 days per week)':
        return bmr * 1.55;
      case 'Very active (intense exercise 6-7 days per week)':
        return bmr * 1.725;
      case 'Extremely active (intense exercise every day, professional athlete)':
        return bmr * 1.9;
      default:
        return 0.0; // Handle the default case
    }
  }

  double calculateCaloriesNeeded(double tdee, String objective) {
    if (objective == 'gain weight') {
      return tdee + 500;
    } else {
      return tdee - 500;
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmr = calculateBMR();
    double tdee = calculateTDEE(bmr);
    double caloriesNeeded = calculateCaloriesNeeded(tdee, objective);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seventh Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BMR: $bmr'),
            Text('TDEE: $tdee'),
            Text('Calories Needed: $caloriesNeeded'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next page or perform other actions
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Finish',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
