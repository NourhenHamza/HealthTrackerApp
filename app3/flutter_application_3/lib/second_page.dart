import 'package:flutter/material.dart';

import 'third_page.dart'; // Import your ThirdPage
import 'user_model.dart'; // Import your UserModel class

class SecondPage extends StatefulWidget {
  final UserModel user;

  const SecondPage({Key? key, required this.user}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello there!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Username:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            buildTextField('Enter your username'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String enteredUsername = usernameController.text;
                if (enteredUsername.isNotEmpty) {
                  widget.user.username = enteredUsername;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage(user: widget.user)),
                  );
                } else {
                  // Show an error message or provide feedback to the user
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter a username before submitting.'),
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

  Widget buildTextField(String hint) {
    return SizedBox(
      width: 150,
      child: TextField(
        controller: usernameController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
        ),
      ),
    );
  }
}
