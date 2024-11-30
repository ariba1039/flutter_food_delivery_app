import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/provider/cart_provider.dart';
import 'package:flutter_food_delivery_app/view/onboard_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root widget of the app
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardScreen(),
      ),
    );
  }}