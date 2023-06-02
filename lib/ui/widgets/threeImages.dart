import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_uae/controllers/threeImagesController.dart';
import 'package:web_uae/core/sizes.dart';

import '../../core/constants/scrollerImages.dart';

class ThreeImages extends StatelessWidget {
  const ThreeImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThreeImagesController imagesController = Get.put(ThreeImagesController());
    getWidth(int index, context) {
      if (!isLandscape(context)) {
        if (imagesController.indexHover == index) {
          return MediaQuery.of(context).size.width / 1.1;
        } else {
          return MediaQuery.of(context).size.width / 1.1;
        }
      } else {
        if (imagesController.indexHover == index) {
          return MediaQuery.of(context).size.width / 2;
        } else {
          return MediaQuery.of(context).size.width / 4;
        }
      }
    }

    getHeight(int index, context) {
      if (!isLandscape(context)) {
        if (imagesController.indexHover == index) {
          return MediaQuery.of(context).size.height / 2;
        } else {
          return MediaQuery.of(context).size.height / 2.05;
        }
      } else {
        if (imagesController.indexHover == index) {
          return MediaQuery.of(context).size.height / 3;
        } else {
          return MediaQuery.of(context).size.height / 3.1;
        }
      }
    }

    list() {
      return List.generate(
          IconsWidgetsLists.iconsImagesUrls.length,
          (index) => MouseRegion(
                onHover: (event) {
                  imagesController.setHover(index);
                },
                onExit: (event) {
                  imagesController.setHover(-1);
                },
                child: GetBuilder<ThreeImagesController>(builder: (controller) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: controller.indexHover == index ? 6 : 3,
                          blurRadius: controller.indexHover == index ? 3 : 6,
                          // offset:
                          //     ? const Offset(-8, 8)
                          //     : const Offset(0, 0),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                    width: isLandscape(context)
                        ? MediaQuery.of(context).size.width / 4
                        : MediaQuery.of(context).size.width / 1.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            AnimatedContainer(
                              width: getWidth(index, context),
                              height: getHeight(index, context),
                              duration: const Duration(milliseconds: 800),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    IconsWidgetsLists.iconsImagesUrls[index],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              color: IconsWidgetsLists.iconsColor[index]
                                  .withOpacity(0.85),
                              width: isLandscape(context)
                                  ? MediaQuery.of(context).size.width / 4
                                  : MediaQuery.of(context).size.width / 1.1,
                              height: isLandscape(context)
                                  ? MediaQuery.of(context).size.height / 3
                                  : MediaQuery.of(context).size.height / 2,
                              child: Center(
                                child: Image.asset(
                                  IconsWidgetsLists.iconsIcons[index],
                                  width: 100,
                                  height: 100,
                                  color: Colors.white,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ListTile(
                          title: Center(
                            child: Text(
                              IconsWidgetsLists.iconsTitle[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        ListTile(
                          subtitle: Center(
                            child: Text(
                              IconsWidgetsLists.iconsLabel[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Cairo',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 44,
                        ),
                      ],
                    ),
                  );
                }),
              ));
    }

    return Column(
      children: [
        Container(
          height: isLandscape(context)
              ? MediaQuery.of(context).size.height / 1.43
              : MediaQuery.of(context).size.height / 3.1,
        ),
        isLandscape(context)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list(),
              ),
      ],
    );
  }
}
