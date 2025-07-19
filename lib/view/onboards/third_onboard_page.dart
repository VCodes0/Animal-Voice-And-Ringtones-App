import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../app pages/terms_of_use.dart';

class ThirdOnboardingPage extends StatelessWidget {
  const ThirdOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: mq.height * 0.55,
            child: Image.asset("assets/O32.png", fit: BoxFit.cover),
          ),
          Positioned(
            top: mq.height * 0.035,
            left: 0,
            right: 0,
            height: mq.height * 0.7,
            child: SizedBox(
              child: Center(
                child: Image.asset(
                  "assets/O3.png",
                  fit: BoxFit.contain,
                  width: mq.width * 0.8,
                  height: mq.height * 0.4,
                ),
              ),
            ),
          ),
          Positioned(
            top: mq.height * 0.6,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Facts & More",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: mq.width * 0.065,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: mq.height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mq.width * 0.1),
                  child: Text(
                    "Discover fascinating facts about animals \n with Wikipedia information while enjoying \n their unique sounds!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: mq.width * 0.035,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: mq.height * 0.06,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => Get.to(() => TermsOfUsePage()),
                child: Image.asset("assets/O33.png", height: mq.width * 0.15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
