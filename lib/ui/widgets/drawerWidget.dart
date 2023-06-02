import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_uae/controllers/dropController.dart';
import 'package:web_uae/core/constants/approutes.dart';
import 'package:web_uae/core/sizes.dart';
import 'package:web_uae/ui/screens/homePage.dart';
import 'package:web_uae/ui/widgets/siteIcon.dart';

class DrawerBtnWidget extends StatelessWidget {
  const DrawerBtnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DropController dropController = Get.find();
    double width = MediaQuery.of(context).size.width / 2;
    actionTitleWidget(int index) {
      return Container(
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
            if (index == 0) {
              dropController.setDrawerHover(false, dropController.indexShow);
              Get.offAll(
                const HomePage(),
              );
            } else if (dropController.isDrawerHover) {
              if (dropController.indexShow == index) {
                dropController.setDrawerHover(false, index);
              } else {
                dropController.setDrawerHover(false, index);
                dropController.setDrawerHover(true, index);
              }
            } else {
              dropController.setDrawerHover(true, index);
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
            trailing: dropController.indexShow == index &&
                    dropController.isDrawerHover
                ? const Icon(CupertinoIcons.chevron_up)
                : const Icon(CupertinoIcons.chevron_down),
          ),
        ),
      );
    }

    actionDropListWidget(int index) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        margin: const EdgeInsets.only(top: 60),
        child: dropController.isDrawerHover && dropController.indexShow == index
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

    listWidget() {
      return List.generate(
        dropController.dropLists.length,
        (index) => MouseRegion(
          // onHover: (event) {
          //   dropController.setDrawerHover(true, index);
          // },
          // onExit: (event) {
          //   dropController.setDrawerHover(false, index);
          // },
          child: Stack(
            children: [
              actionTitleWidget(index),
              actionDropListWidget(index),
            ],
          ),
        ),
      );
    }

    return Drawer(
      child: GetBuilder<DropController>(
        builder: (controller) {
          return  Column(
            children: [
              const DrawerHeader(child: SiteIconWidget()),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: listWidget(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
