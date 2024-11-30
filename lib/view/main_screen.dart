import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/model/bottom_icon_model.dart';
import 'package:flutter_food_delivery_app/utils/app_colors.dart';
import 'package:flutter_food_delivery_app/view/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List selectedPage = [
    const HomeScreen(),
    const Center(child: Text('message page ')),
    const Center(child: Text('Explore page ')),
    const Center(child: Text('Profile page ')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgColor,
      bottomNavigationBar: Container(
        height: 85,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
                bottomIcons.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              currentIndex == index
                                  ? bottomIcons[index].selected
                                  : bottomIcons[index].unselected,
                              color:
                                  currentIndex == index ? korange : Colors.grey,
                              size: 30,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: kblack,
                                shape: BoxShape.circle,
                              ),
                              width: currentIndex == index ? 7 : 0,
                              height: currentIndex == index ? 7 : 0,
                            )
                          ],
                        ),
                      ),
                    )),
          ],
        ),
      ),
      body: selectedPage[currentIndex],
    );
  }
}
