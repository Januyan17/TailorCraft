// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:tailorcraft/Colors/Colors.dart';
import 'package:tailorcraft/Screens/Authentication/SignIn.dart';
import 'package:newton_particles/newton_particles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor("#2D2E2E"),
      body: Newton(
        activeEffects: [
          RainEffect(
              particleConfiguration: ParticleConfiguration(
                shape: CircleShape(),
                size: const Size(5, 5),
                color: const SingleParticleColor(color: Colors.purple),
              ),
              effectConfiguration: const EffectConfiguration())
        ],
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Center(
                child: Text(
              "Tailor Craft",
              style: TextStyle(
                  fontFamily: 'lemon',
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
            SizedBox(
              height: screenHeight * 0.07,
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Customize Your ",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Look",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      )
                    ],
                  ),
                  Text(
                    " Own the Road",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    "Style is a reflection of your attitude and personality. Find yours at Tailor Craft.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[400]),
                  ),
                  SizedBox(
                    height: screenHeight * 0.38,
                  ),
                ],
              ),
            )
          ],
        ))),
      ),
    );
  }
}
