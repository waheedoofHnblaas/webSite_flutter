import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_uae/ui/widgets/drawerWidget.dart';
import 'package:web_uae/ui/widgets/sliverAppBars.dart';

import '../widgets/dropBtn.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerBtnWidget(),
      body: Stack(
        children: [
          CustomScrollView(
            primary: true,
            slivers: [
              appbar1(context),
              const AppBar2(),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                  child: Text('data'),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 100),
              ),
            ],
          ),
          // Positioned(
          //   top: Get.height / 12,
          //   right: 80,
          //   child: const DropBtnWidget(),
          // ),
        ],
      ),
    );
  }
}
