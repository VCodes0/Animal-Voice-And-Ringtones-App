import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../../main.dart';
import '../onboards/first_onboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Get.off(() => FirstOnboardingPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.png",
                  width: mq.width * 0.4,
                  height: mq.width * 0.4,
                ),
                SizedBox(height: mq.height * 0.03),
                Text(
                  "Animal Sound Prank & \n Ringtones",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: mq.width * 0.055,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
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
              child: CircleAvatar(
                backgroundColor: CupertinoColors.transparent,
                radius: 40,
                backgroundImage: AssetImage("assets/Paw Loader 1.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
