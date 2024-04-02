import 'package:flutter/material.dart';

import 'second_page.dart';
import 'user_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Care App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Our Nutritional Personal Program',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Description: Unleash the power of nutrition and embark '
              'on a flavorful journey to a healthier, happier you! 🌱✨',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'lib/avocado.jpg',
              height: 400,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Initialize the user data
                UserModel user = UserModel(username: '', age: 0, gender: '', height: 0.0, weight: 0.0);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage(user: user)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'It\'s Perfect, Let\'s Begin',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
