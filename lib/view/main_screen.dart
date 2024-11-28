import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/model/bottom_icon_model.dart';
import 'package:flutter_food_delivery_app/utils/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgColor,
      bottomNavigationBar: Container(
        height: 85,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(bottomIcons.length , (index) {
              return IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  color: kblack,
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}