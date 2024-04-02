import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'fourth_page.dart';
import 'user_model.dart';

class ThirdPage extends StatelessWidget {
  final UserModel user;

  const ThirdPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'First of all, let\'s know more about your personal details.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            buildWhiteBoxTextFieldWithLabel('Age', 'Enter your age', true, user),
            const SizedBox(height: 10),
            buildWhiteBoxTextFieldWithLabel('Height', 'Enter your height', true, user),
            const SizedBox(height: 10),
            buildWhiteBoxTextFieldWithLabel('Weight', 'Enter your weight', true, user),
            const SizedBox(height: 10),
            buildWhiteBoxDropdownWithLabel('Gender', ['Male', 'Female'], user),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next page (FourthPage) only if all fields are filled
                if (user.age != null && user.height != null && user.weight != null && user.gender.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FourthPage(user: user)),
                  );
                } else {
                  // Show an error message or provide feedback to the user
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please fill in all the details before proceeding.'),
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
                foregroundColor: Colors.white, backgroundColor: Colors.green,
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

  Widget buildWhiteBoxTextFieldWithLabel(
      String label, String hint, bool isNumeric, UserModel user) {
    final controller = TextEditingController();

    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: controller,
              keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
              inputFormatters: isNumeric
                  ? [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(3)]
                  : null,
              onChanged: (value) {
                // Update the corresponding field in the user object if input is numeric
                if (isNumeric) {
                  double parsedValue = double.tryParse(value) ?? 0;
                  if (label == 'Age') {
                    if (parsedValue < 100) {
                      user.age = parsedValue;
                    } else {
                      controller.text = '99'; // set maximum value if exceeded
                    }
                  } else if (label == 'Height') {
                    if (parsedValue < 300) {
                      user.height = parsedValue;
                    } else {
                      controller.text = '299'; // set maximum value if exceeded
                    }
                  } else if (label == 'Weight') {
                    if (parsedValue < 700) {
                      user.weight = parsedValue;
                    } else {
                      controller.text = '699'; // set maximum value if exceeded
                    }
                  }
                }
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: hint,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWhiteBoxDropdownWithLabel(
      String label, List<String> options, UserModel user) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              items: options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? selectedValue) {
                // Update the gender in the user object
                user.gender = selectedValue!;
              },
              isExpanded: true,
              value: user.gender.isNotEmpty ? user.gender : options[0],
            ),
          ),
        ],
      ),
    );
  }
}
