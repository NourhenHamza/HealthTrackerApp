import 'package:flutter/material.dart';

import 'eighth_page.dart'; // Import the EighthPage
import 'user_model.dart';

class FifthPage extends StatefulWidget {
  final UserModel user;
  final String activityLevel;
  final double bmi;

  const FifthPage({Key? key, required this.user, required this.activityLevel, required this.bmi}) : super(key: key);

  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  TextEditingController weightController = TextEditingController();

  Widget buildTextField(String hint) {
    return SizedBox(
      width: 150,
      child: TextField(
        controller: weightController,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
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
String interpretBMI(double bmi) {
  if (bmi < 18.5) {
    return 'Insuffisance pondérale';
  } else if (bmi < 25) {
    return 'Poids normal';
  } else if (bmi < 30) {
    return 'Surpoids';
  } else if (bmi < 35) {
    return 'Obésité de classe I (modérée)';
  } else if (bmi < 40) {
    return 'Obésité de classe II (sévère)';
  } else {
    return 'Obésité de classe III (très sévère ou morbide)';
  }
}


  @override
Widget build(BuildContext context) {
  double bmi = calculateBMI();
  String bmiCategory = interpretBMI(bmi);

  return Scaffold(
    appBar: AppBar(
      title: const Text('Fifth Page'),
    ),
    body: Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text('BMI: $bmi'),
          const SizedBox(height: 20),
          Text('BMI Category: $bmiCategory'),
          const SizedBox(height: 20),
          
           // Include the weight input field
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
               
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EighthPage(
                      user: widget.user,
                      activityLevel: widget.activityLevel,
                      bmi: bmi,
                    ),
                  ),
                );
              
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
