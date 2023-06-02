import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_uae/core/constants/scrollerImages.dart';

class ScrollerController extends GetxController {
  int currentPageIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void onInit() {
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        nav();
      },
    );
    super.onInit();
  }

  nav() {
    if (currentPageIndex > imageUrls.length) {
      currentPageIndex = -1;
    }
    currentPageIndex++;
    pageController.animateToPage(
      currentPageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  navBack() {
    if (currentPageIndex <1) {
      currentPageIndex = imageUrls.length;
    }
    currentPageIndex--;
    pageController.animateToPage(
      currentPageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void setPageIndex(int index) {
    currentPageIndex = index;
    update();
  }
}
