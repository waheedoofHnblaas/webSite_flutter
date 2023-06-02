import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_uae/ui/screens/homePage.dart';

class SiteIconWidget extends StatelessWidget {
  const SiteIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.offAll(
          const HomePage(),
        );
      },
      child: Image.asset(
        'assets/images/logo140x80-English.png',
      ),
    );
  }
}