import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_uae/routes.dart';

import 'controllers/dropController.dart';
import 'controllers/scrollerController.dart';
import 'ui/screens/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WAHEED_UAE',
      initialBinding: BindingsBuilder(() {
        Get.put(DropController());
        Get.put(ScrollerController(), permanent: true);
      }),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(22, 89, 185, 1),
        backgroundColor: Colors.white,
        canvasColor: const Color.fromRGBO(208, 222, 241, 1),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Get.theme.canvasColor,
            fontFamily: 'Cairo',
            fontSize: 12,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey,
          titleTextStyle: TextStyle(
            fontFamily: 'Cairo',
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
          toolbarTextStyle: TextStyle(
            fontFamily: 'Cairo',
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
      getPages: routes,
    );
  }
}
