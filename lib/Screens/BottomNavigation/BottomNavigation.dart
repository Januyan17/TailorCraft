// ignore_for_file: unused_local_variable, prefer_const_constructors, no_leading_underscores_for_local_identifiers, use_super_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tailorcraft/GetXControllers/BottomNavController.dart';
import 'package:tailorcraft/Screens/ChatBot/ChatBot.dart';
import 'package:tailorcraft/Screens/HomeScreen/HomeScreen.dart';
import 'package:tailorcraft/Screens/ProfileScreen/ProfileScreen.dart';
import '../../Colors/Colors.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController =
        Get.put(BottomNavController());

    final List<Widget> _screens = [
      HomeScreen(),
      ChatBotScreen(),
      ProfileScreen()
    ];

    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      body: Obx(
        () => _screens[bottomNavController.currentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
          curve: Curves.linear,
          backgroundColor: HexColor("#F4ECFB"),
          currentIndex: bottomNavController.currentIndex.value,
          onTap: (i) => bottomNavController.changeIndex(i),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple.shade700,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.chat),
              title: Text("ChatBot"),
              selectedColor: Colors.purple.shade700,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.purple.shade700,
            ),
          ],
        ),
      ),
    );
  }
}
