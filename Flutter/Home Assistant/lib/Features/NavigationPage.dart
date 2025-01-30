import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Screens/HomeScreen.dart';
import 'package:home_assistant/Features/Planning/Screens/PlanningScreen.dart';
import 'package:home_assistant/Features/SettingsScreen.dart';
import 'package:home_assistant/Features/Statistics/Screens/StatisticsScreen.dart';
import 'package:home_assistant/Utils/Constants.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final screens = [
    const HomeScreen(),
    const PlanningScreen(),
    const StatisticsScreen(),
    const SettingsScreen()
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[index]),
      floatingActionButton: FloatingActionButton(
        heroTag: 'uniqueTag1',
        key: UniqueKey(),
        backgroundColor: Constants.accentColor,
        child: Image.asset(
          "Assets/Icons/microphone.png",
          color: Constants.primaryColor,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: 4,
        tabBuilder: (int index, bool isActive) {
          return Constants.navBarIcons[index];
        },
        activeIndex: index,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (val) {
          setState(() {
            index = val;
          });
        },
        backgroundColor: Constants.accentColor,
      ),
    );
  }
}
