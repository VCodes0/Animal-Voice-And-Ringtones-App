import 'package:flutter/material.dart';

Widget buildPolicyItem(Size screenSize, IconData icon, String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: screenSize.height * 0.02),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: screenSize.width * 0.06, color: Colors.brown[700]),
        SizedBox(width: screenSize.width * 0.03),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: screenSize.width * 0.038,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    ),
  );
}
