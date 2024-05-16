import 'package:flutter/material.dart';
import 'login_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // Adding padding and gradient background
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.lightBlueAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            // Centering the elements vertically and making them cover the entire screen
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Title Text
              Text(
                'Welcome to Ernest Ecommerce',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              // Subtitle Text
              Text(
                'Best place to buy anything you need',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center,
              ),
              // Displaying the image
              Expanded(
                child: Image.asset(
                  'images/ecom.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              // 'Get Started' button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple, // Text color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
