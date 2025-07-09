import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SharePage extends StatelessWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          color: CupertinoColors.white,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(15.9),
                child: Text(
                  textAlign: TextAlign.center,
                  "Thank You Sharing This App\n By The Way This Functionality \n is Cant Work on This App Pls\n Click On The Cancel Button \n For Exit This Page",
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => Get.back(),
                child: CircleAvatar(
                  backgroundColor: CupertinoColors.white,
                  child: Icon(CupertinoIcons.xmark),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
