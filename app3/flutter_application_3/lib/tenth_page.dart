import 'package:flutter/material.dart';

import 'user_model.dart';

class TenthPage extends StatelessWidget {
  final UserModel user;
  final String activityLevel;
  final double bmi;
  final String objective;

  const TenthPage({
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
    if (objective == 'Gain Weight') {
      return tdee + 500;
    } else {
      return tdee - 500;
    }
  }

  double calculateProteinCalories(String gender, double weight, String activityLevel) {
    double proteinIntake = (gender == 'man') ? 1.0 : 0.8; // Default protein intake

    // Adjust protein intake based on activity level
    if (activityLevel == 'Sedentary (little or no exercise)') {
      proteinIntake *= 1.2;
    } else if (activityLevel == 'Lightly active (light exercise 1-3 days per week)') {
      proteinIntake *= 1.375;
    } else if (activityLevel == 'Moderately active (moderate exercise 3-5 days per week)') {
      proteinIntake *= 1.55;
    } else if (activityLevel == 'Very active (intense exercise 6-7 days per week)') {
      proteinIntake *= 1.725;
    } else if (activityLevel == 'Extremely active (intense exercise every day, professional athlete)') {
      proteinIntake *= 2;
    }

    // Calculate protein calories
    return weight * proteinIntake; // Protein has 4 calories per gram
  }

  @override
  Widget build(BuildContext context) {
    double bmr = calculateBMR();
    double tdee = calculateTDEE(bmr);
    double caloriesNeeded = calculateCaloriesNeeded(tdee, objective);
    double proteinCalories = calculateProteinCalories(user.gender ?? '', user.weight ?? 0.0, activityLevel);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tenth Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adjust the text styles here
            Text(
              'Calories Needed:',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Text(
              '$caloriesNeeded',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Protein Calories:',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Text(
              '$proteinCalories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next page or perform other actions
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
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
