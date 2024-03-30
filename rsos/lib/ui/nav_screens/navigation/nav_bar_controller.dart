import 'package:get/get.dart';

class NavBarController extends GetxController {

  var navIndex = 0.obs;

  void changeNavPage(int index) {
    navIndex.value = index;
  }

}