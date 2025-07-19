import 'package:flutter/material.dart';
import 'build_policy_item.dart';

class TOfU2 extends StatelessWidget {
  const TOfU2({super.key, required this.mq});

  final Size mq;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms & Conditions"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: mq.width * 0.05,
          vertical: mq.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Application is warning you about the app that gives you many services and important information for safer and efficient use.",
              style: TextStyle(
                fontSize: mq.width * 0.038,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: mq.height * 0.02),
            Text(
              "User-Generated Content Policy(UGC) By pressing the Accept button, I declare I have read and accepted the following condition of use:",
              style: TextStyle(
                fontSize: mq.width * 0.038,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: mq.height * 0.03),
            buildPolicyItem(
              mq,
              Icons.person,
              "By pressing the Accept button, I declare I have read and accepted the following condition of use :",
            ),
            buildPolicyItem(
              mq,
              Icons.gavel,
              "If we find the app is being used outside its terms of use, we may restrict access to it.",
            ),
            buildPolicyItem(
              mq,
              Icons.block,
              "Any type of modification to the app or its widgets is not allowed.",
            ),
            buildPolicyItem(
              mq,
              Icons.description,
              "Privacy Policy may be updated from time to time for any reason. We will notify you of any changes to our Privacy Policy by posting the new Privacy Policy here.",
            ),
            buildPolicyItem(
              mq,
              Icons.visibility_off,
              "We do not share any kind of your Personal Data with third parties.",
            ),
            SizedBox(height: mq.height * 0.04),
            Text(
              "You can find out more information by clicking on the Following link :",
              style: TextStyle(
                fontSize: mq.width * 0.038,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: mq.height * 0.05),
            Image.asset(
              "assets/Rectangle 18.png",
              width: mq.width,
              fit: BoxFit.cover,
            ),
            SizedBox(height: mq.height * 0.03),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, color: Colors.black, size: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
