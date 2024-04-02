import 'package:flutter/material.dart';

import 'tenth_page.dart';
import 'user_model.dart';

class NinthPage extends StatefulWidget {
  final UserModel user;
  final String objective;
  final String activityLevel; // Add activityLevel parameter
  final double bmi; // Add bmi parameter

  NinthPage({
    Key? key,
    required this.user,
    required this.objective,
    required this.activityLevel,
    required this.bmi,
  }) : super(key: key);

  @override
  _NinthPageState createState() => _NinthPageState();
}

class _NinthPageState extends State<NinthPage> {
  TextEditingController targetWeightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ninth Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter Your Target Weight',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: targetWeightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Target Weight (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String enteredTargetWeight = targetWeightController.text;

                if (enteredTargetWeight.isNotEmpty) {
                  double targetWeight = double.parse(enteredTargetWeight);

                  if (widget.objective == 'Lose Weight' && targetWeight < widget.user.weight) {
                    // Navigate to TenthPage if the objective is to lose weight and target weight is lower
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TenthPage(
                          user: widget.user,
                          activityLevel: widget.activityLevel,
                          bmi: widget.bmi,
                          objective: widget.objective,
                        ),
                      ),
                    );
                  } else if (widget.objective == 'Gain Weight' && targetWeight > widget.user.weight) {
                    // Navigate to TenthPage if the objective is to gain weight and target weight is higher
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TenthPage(
                          user: widget.user,
                          activityLevel: widget.activityLevel,
                          bmi: widget.bmi,
                          objective: widget.objective,
                        ),
                      ),
                    );
                  } else {
                    // Show an error message if the target weight doesn't meet the criteria
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Invalid target weight for the selected objective.'),
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
                } else {
                  // Show an error message or provide feedback to the user
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter a target weight before submitting.'),
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
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
