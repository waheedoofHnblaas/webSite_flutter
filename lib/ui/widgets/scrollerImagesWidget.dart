import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_uae/controllers/scrollerController.dart';
import 'package:web_uae/core/constants/scrollerImages.dart';
import 'package:web_uae/core/sizes.dart';

class ScrollImages extends StatelessWidget {
  const ScrollImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: isLandscape(context)
          ? MediaQuery.of(context).size.height / 1.4
          : MediaQuery.of(context).size.height / 3,
      child: GetBuilder<ScrollerController>(builder: (scrollController) {
        return Stack(
          children: [
            PageView.builder(
              padEnds: true,
              itemCount: imageUrls.length,
              scrollDirection: Axis.horizontal,
              controller: scrollController.pageController,
              itemBuilder: (context, index) {
                return Image.asset(
                  imageUrls[index],
                  fit: BoxFit.fill,
                );
              },
              onPageChanged: (index) {
                scrollController.setPageIndex(index);
              },
            ),
            Positioned(
              top: Get.height / 3,
              left: 0,
              child: IconButton(
                onPressed: () {
                  scrollController.nav();
                },
                icon: const Icon(Icons.arrow_back_ios,
                    size: 33, color: Colors.white),
              ),
            ),
            Positioned(
              right: 0,
              top: Get.height / 3,
              child: IconButton(
                onPressed: () {
                  scrollController.navBack();
                },
                icon: const Icon(Icons.arrow_forward_ios,
                    size: 33, color: Colors.white),
              ),
            ),
          ],
        );
      }),
    );
  }
}
