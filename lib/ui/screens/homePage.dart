import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_uae/controllers/dropController.dart';
import 'package:web_uae/core/sizes.dart';
import 'package:web_uae/ui/widgets/drawerWidget.dart';
import 'package:web_uae/ui/widgets/dropBtn.dart';
import 'package:web_uae/ui/widgets/footer.dart';
import 'package:web_uae/ui/widgets/personWidget.dart';
import 'package:web_uae/ui/widgets/scrollerImagesWidget.dart';
import 'package:web_uae/ui/widgets/threeImages.dart';
import '../widgets/sliverAppBars.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DropController dropController = Get.find();
    return Scaffold(
      // key: dropController.scaffoldKey,
      drawer: const DrawerBtnWidget(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        primary: false,
        shrinkWrap: false,
        slivers: [
          appbar1(context),
          const AppBar2(),
          SliverToBoxAdapter(
            child: Stack(
              children: const [
                ScrollImages(),
                ThreeImages(),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
          const SliverToBoxAdapter(
            child: PersonWidgetSeeMore(),
          ),
          const SliverToBoxAdapter(
            child:  const Footer(),
          ),

        ],
      ),
    );
  }
}


