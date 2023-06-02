import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_uae/controllers/dropController.dart';
import 'package:web_uae/core/sizes.dart';
import 'package:web_uae/ui/widgets/dropBtn.dart';
import 'package:web_uae/ui/widgets/siteIcon.dart';

appbar1(context) {
  return SliverAppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Get.theme.primaryColor,
    expandedHeight: Get.height / 12,
    toolbarHeight: isLandscape(context) ? 50 : 100,
    title: isLandscape(context)
        ? Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.phone_enabled,
                    size: 18,
                    color: Get.theme.canvasColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '971-45294385',
                    style: Get.textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(
                width: 22,
              ),
              Row(
                children: [
                  Icon(
                    Icons.email,
                    size: 18,
                    color: Get.theme.canvasColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'info@tqtcenter.com',
                    style: Get.textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(
                width: 22,
              ),
              Row(
                children: [
                  Icon(
                    Icons.not_listed_location_sharp,
                    size: 18,
                    color: Get.theme.canvasColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Dubai United Arab Emirates',
                    style: Get.textTheme.titleLarge,
                  ),
                ],
              ),
            ],
          )
        : Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.phone_enabled,
                    size: 18,
                    color: Get.theme.canvasColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '971-45294385',
                    style: Get.textTheme.titleLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.email,
                    size: 18,
                    color: Get.theme.canvasColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'info@tqtcenter.com',
                    style: Get.textTheme.titleLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.not_listed_location_sharp,
                    size: 18,
                    color: Get.theme.canvasColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Dubai United Arab Emirates',
                    style: Get.textTheme.titleLarge,
                  ),
                ],
              ),
            ],
          ),
    floating: true,
  );
}

class AppBar2 extends StatefulWidget {
  const AppBar2({Key? key}) : super(key: key);

  @override
  State<AppBar2> createState() => _AppBar2State();
}

class _AppBar2State extends State<AppBar2> with SingleTickerProviderStateMixin {
  DropController dropController = Get.find();

  @override
  void initState() {
    dropController.controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    dropController.animation =
        Tween<double>(begin: 100, end: 500).animate(dropController.controller)
          ..addListener(
            () {
              setState(() {});
            },
          );
    // dropController.controller.reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DropController>(
      builder: (controller) {
        if (!controller.controller.isAnimating) {
          if (controller.isHover) {
            controller.controller.forward();
          } else {
            controller.controller.reverse();
          }
        }

        return SliverAppBar(
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          toolbarHeight: controller.isHover && controller.indexShow != 0
              ? controller.animation.value / 1.2
              : controller.animation.value / 1.2,
          automaticallyImplyLeading: true,
          titleSpacing: 0,
          elevation: 0,
          pinned: true,
          floating: false,
          actions: const [
            DropBtnWidget(),
          ],
          title: Row(
            children: [
              const SiteIconWidget(),
              Expanded(child: Container()),
            ],
          ),
        );
      },
    );
  }
}

