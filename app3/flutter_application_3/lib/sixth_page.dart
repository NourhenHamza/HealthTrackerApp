import 'package:flutter/material.dart';

import 'user_model.dart'; // Import your UserModel

class SixthPage extends StatelessWidget {
  final UserModel user;
  final String activityLevel;
  final double bmi;
  final String objective;

  const SixthPage({Key? key, required this.user, required this.activityLevel, required this.bmi,required this.objective,}) : super(key: key);

  double calculateBMI() {
    if (user.height != null && user.weight != null) {
      return user.weight! / ((user.height! / 100) * (user.height! / 100));
    } else {
      // Return a default value or handle the error case
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmi = calculateBMI();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sixth Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Summary:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text('Username: ${user.username}'),
            Text('Age: ${user.age}'),
            Text('Gender: ${user.gender}'),
            Text('Height: ${user.height}'),
            Text('Weight: ${user.weight}'),
            Text('Activity Level: $activityLevel'),
            Text('BMI: $bmi'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next page or perform other actions
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green,
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
