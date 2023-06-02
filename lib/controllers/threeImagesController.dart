


import 'package:get/get.dart';

class ThreeImagesController extends GetxController{

  int indexHover = -1;

  @override
  void onInit() {


    super.onInit();
  }

  setHover(int i){
    indexHover=i;
    update();
  }



}