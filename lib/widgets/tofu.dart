import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/app pages/category_page.dart';
import 'build_policy_item.dart';

class TOfU extends StatelessWidget {
  const TOfU({super.key, required this.screenSize});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.05,
        vertical: screenSize.height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Application is warning you about the app that gives you many services and important information for safer and efficient use.",
            style: TextStyle(
              fontSize: screenSize.width * 0.038,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
          Text(
            "User-Generated Content Policy(UGC) By pressing the Accept button, I declare I have read and accepted the following condition of use:",
            style: TextStyle(
              fontSize: screenSize.width * 0.038,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: screenSize.height * 0.03),
          buildPolicyItem(
            screenSize,
            Icons.person,
            "By pressing the Accept button, I declare I have read and accepted the following condition of use :",
          ),
          buildPolicyItem(
            screenSize,
            Icons.gavel,
            "If we find the app is being used outside its terms of use, we may restrict access to it.",
          ),
          buildPolicyItem(
            screenSize,
            Icons.block,
            "Any type of modification to the app or its widgets is not allowed.",
          ),
          buildPolicyItem(
            screenSize,
            Icons.description,
            "Privacy Policy may be updated from time to time for any reason. We will notify you of any changes to our Privacy Policy by posting the new Privacy Policy here.",
          ),
          buildPolicyItem(
            screenSize,
            Icons.visibility_off,
            "We do not share any kind of your Personal Data with third parties.",
          ),
          SizedBox(height: screenSize.height * 0.04),
          Text(
            "You can find out more information by clicking on the Following link :",
            style: TextStyle(
              fontSize: screenSize.width * 0.038,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: screenSize.height * 0.01),
          Text(
            "Terms and conditions of use",
            style: TextStyle(
              fontSize: screenSize.width * 0.04,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(height: screenSize.height * 0.01),
          Text(
            "Privacy policy.",
            style: TextStyle(
              fontSize: screenSize.width * 0.04,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(height: screenSize.height * 0.05),
          Center(child: AcceptButton(screenSize: screenSize)),
          SizedBox(height: screenSize.height * 0.04),
          Image.asset(
            "assets/Rectangle 18.png",
            width: screenSize.width,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class AcceptButton extends StatelessWidget {
  const AcceptButton({super.key, required this.screenSize});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.offAll(() => CategoryPage());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown[700],
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.15,
          vertical: screenSize.height * 0.02,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenSize.width * 0.02),
        ),
      ),
      child: Text(
        "Accept",
        style: TextStyle(
          fontSize: screenSize.width * 0.045,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
