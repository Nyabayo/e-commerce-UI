import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'home_screen.dart';
import 'login_page.dart';
import 'signup_otp_screen.dart';
import 'profile_screen.dart';
import 'cart_screen.dart';
import 'product_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ernest Ecommerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5DC),
      ),
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}
