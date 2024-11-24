import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/model/onboard_model.dart';
import 'package:flutter_food_delivery_app/utils/app_colors.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
       body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            onPageChanged: (value) {
              
            },
            itemCount: onboards.length,
            
            itemBuilder: (context, index) {
            return Stack(


            );
          })
        ],
       ),
      );
  }
}