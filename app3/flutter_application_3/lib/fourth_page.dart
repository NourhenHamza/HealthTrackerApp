import 'package:flutter/material.dart';

import 'fifth_page.dart'; // Import your FifthPage
import 'user_model.dart'; // Import your UserModel
 

class FourthPage extends StatefulWidget {
  final UserModel user;

  const FourthPage({Key? key, required this.user}) : super(key: key);

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  String? selectedChoice;

  List<String> choices = [
    'Sedentary (little or no exercise)',
    'Lightly active (light exercise 1-3 days per week)',
    'Moderately active (moderate exercise 3-5 days per week)',
    'Very active (intense exercise 6-7 days per week)',
    'Extremely active (intense exercise every day, professional athlete)',
  ];

  Widget buildChoiceCard(String choice) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedChoice = choice;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selectedChoice == choice ? Colors.green : Colors.white,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          choice,
          style: TextStyle(
            fontSize: 16,
            color: selectedChoice == choice ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  double calculateBMI() {
    if (widget.user.height != null && widget.user.weight != null) {
      return widget.user.weight! / ((widget.user.height! / 100) * (widget.user.height! / 100));
    } else {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fourth Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select your activity level:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            for (String choice in choices) buildChoiceCard(choice),
            ElevatedButton(
              onPressed: () {
                if (selectedChoice != null) {
                  Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => FifthPage(
      user: widget.user,
      activityLevel: selectedChoice!,
     
      bmi: calculateBMI(),
    ),
  ),
);

                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please select your activity level before proceeding.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
