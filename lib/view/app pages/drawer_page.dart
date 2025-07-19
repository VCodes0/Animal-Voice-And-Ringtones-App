import 'package:animal_app/widgets/tofu2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/build_drawer_button.dart';
import 'category_page.dart';
import 'rate_us_page.dart';
import 'share_page.dart';
import 'terms_of_use.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Drawer(
      width: mq.width * 0.85,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Container(
        color: const Color(0xFF8B4513),
        child: Stack(
          children: [
            Positioned(
              top: mq.height * 0.05,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: mq.height * 0.17,
                    width: mq.width * 0.25,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: mq.height * 0.02),
                ],
              ),
            ),
            Positioned(
              top: mq.height * 0.25,
              left: mq.width * 0.05,
              right: mq.width * 0.05,
              child: Column(
                children: [
                  SizedBox(height: mq.height * 0.015),
                  buildDrawerButton(
                    context,
                    icon: Icons.grid_view,
                    text: "Categories",
                    onPressed: () {
                      Navigator.pop(context);
                      Get.to(() => const CategoryPage());
                    },
                  ),
                  SizedBox(height: mq.height * 0.015),
                  buildDrawerButton(
                    context,
                    icon: CupertinoIcons.paw,
                    text: "All Animals",
                    onPressed: () {
                      Navigator.pop(context);
                      Get.to(() => const CategoryPage());
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              top: mq.height * 0.6,
              left: mq.width * 0.05,
              right: mq.width * 0.05,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildBottomDrawerItem(
                    context,
                    icon: Icons.star_rate_rounded,
                    text: "Rate Us",
                    onTap: () {
                      Get.to(() => RateUsPage());
                    },
                  ),
                  SizedBox(height: mq.height * 0.02),
                  buildBottomDrawerItem(
                    context,
                    icon: Icons.policy,
                    text: "Terms & Conditions",
                    onTap: () {
                      Get.to(() => TOfU2(mq: mq));
                    },
                  ),
                  SizedBox(height: mq.height * 0.02),
                  buildBottomDrawerItem(
                    context,
                    icon: Icons.share,
                    text: "Share App",
                    onTap: () {
                      Get.to(() => SharePage());
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: mq.height * 0.03,
              left: 0,
              right: 0,
              child: GestureDetector(
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
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
