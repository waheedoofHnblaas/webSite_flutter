import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropController extends GetxController {
  bool isHover = false;
  bool isDrawerHover = false;
  int indexShow = -1;
  late Animation<double> animation;
  late AnimationController controller;
  bool toggled = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  displayDrawer(BuildContext context) {
    scaffoldKey.currentState!.openDrawer();
  }

  void toggle() {
    toggled ? controller.reverse() : controller.forward();
    toggled = !toggled;
  }

  @override
  void onInit() {
    super.onInit();
  }

  void setHover(bool bool, int index) {
    isHover = index == 0 ? false : bool;
    indexShow = index;
    update();
  }

  void setDrawerHover(bool bool, int index) {
    isDrawerHover = index == 0 ? false : bool;
    indexShow = index;
    update();
  }

  List<List<String>> dropLists = [
    ['Home'],
    [
      'Company',
      'About Us',
      'Board of Directors',
      'Our international accreditation',
      'Certificates of Appreciation',
      'Our Clients',
      'Downloads',
      'Media Center',
    ],
    [
      'Training',
      'Consulting',
      'IELTS',
      'Register',
      'Aljuda Newspaper',
      'Contact Us',
    ],
    [
      'IELTS',
      'Register',
      'Aljuda Newspaper',
      'Contact Us',
    ],
  ];
}
