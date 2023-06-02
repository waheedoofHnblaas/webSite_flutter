import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool isLandscape(BuildContext context) {
  if (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height &&
      MediaQuery.of(context).size.width > 700) {
    return true;
  } else {
    return false;
  }
}
bool isLandscapeAppBar2(BuildContext context) {
  if (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height &&
      MediaQuery.of(context).size.width > 1000) {
    return true;
  } else {
    return false;
  }
}
