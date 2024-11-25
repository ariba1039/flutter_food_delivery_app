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
              onPageChanged: (value) {},
              itemCount: onboards.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Positioned(
                      top: -70,
                      left: 0,
                      right: 0,
                      
                      child: Image.asset(
                        onboards[index].image,
                        width: 600,
                        height: 600,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 1.9,
                      child: Padding(

                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: Column(
                          children: [
                            Text(
                              onboards[index].text1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              onboards[index].text2,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }
}
