import 'package:flutter/material.dart';

import '../../main.dart';
import '../../widgets/tofu.dart';


class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Terms of Use",
          style: TextStyle(
            color: Colors.black,
            fontSize: mq.width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: TOfU(screenSize: mq),
    );
  }
}
