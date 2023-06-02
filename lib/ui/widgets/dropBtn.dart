import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_uae/controllers/dropController.dart';
import 'package:web_uae/core/constants/approutes.dart';
import 'package:web_uae/core/sizes.dart';
import 'package:web_uae/ui/screens/aboutUsPage.dart';
import 'package:web_uae/ui/screens/homePage.dart';

class DropBtnWidget extends StatelessWidget {
  const DropBtnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DropController dropController = Get.find();
    double width = MediaQuery.of(context).size.width / 5;
    actionTitleWidget(int index) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 40,
        width: width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: dropController.indexShow == index
                  ? Get.theme.primaryColor
                  : Colors.transparent,
            ),
          ),
        ),
        child: InkWell(
          onTap: () {
            if (dropController.isHover) {
              dropController.setHover(false, index);
            } else {
              dropController.setHover(true, index);
            }
            if (index == 0) {
              Get.offAll(
                const HomePage(),
              );
            }
          },
          child: ListTile(
            title: SizedBox(
              width: width,
              child: Text(
                dropController.dropLists[index].first,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    }

    actionDropListWidget(int index) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: double.infinity,
        margin: const EdgeInsets.only(top: 60),
        child: dropController.isHover && dropController.indexShow == index
            ? SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    dropController.dropLists[index].length,
                    (index2) => index2 == 0
                        ? Container()
                        : Container(
                            width: width,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: .3,
                                ),
                              ),
                            ),
                            child: InkWell(
                              onTap: () async {
                                if (dropController.animation.status ==
                                    AnimationStatus.completed) {
                                  await dropController.controller.reverse();
                                }

                                switch (index) {
                                  case 0:
                                    if (index2 == 0) {
                                      Get.offAllNamed(
                                        AppRoute.homePage,
                                      );
                                      Get.reset();
                                    }
                                    break;

                                  case 1:
                                    if (index2 == 1) {
                                      Get.toNamed(AppRoute.aboutUs);
                                    }
                                    break;
                                  default:
                                }
                              },
                              child: ListTile(
                                tileColor: Colors.white,
                                title: Text(
                                  dropController.dropLists[index][index2],
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              )
            : Container(),
      );
    }

    return GetBuilder<DropController>(
      builder: (controller) {
        return isLandscapeAppBar2(context)
            ? SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      controller.dropLists.length,
                      (index) => MouseRegion(
                        onHover: (event) {
                          if(!dropController.isHover) {
                            controller.setHover(true, index);
                          }
                        },
                        onExit: (event) {
                          controller.setHover(false, index);
                        },
                        child: Stack(
                          children: [
                            actionTitleWidget(index),
                            actionDropListWidget(index),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
