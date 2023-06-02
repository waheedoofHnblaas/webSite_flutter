
import 'package:get/get.dart';
import 'package:web_uae/ui/screens/aboutUsPage.dart';
import 'package:web_uae/ui/screens/homePage.dart';

import 'core/constants/approutes.dart';

List<GetPage<dynamic>>? routes = [

  GetPage(
    name: AppRoute.homePage,
    page: () => const HomePage(),
  ),
  GetPage(
    name: AppRoute.aboutUs,
    page: () => const AboutUsPage(),
  ),
];
