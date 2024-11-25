import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/view/onboard_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root widget of the app
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardScreen(),
    );
  }}