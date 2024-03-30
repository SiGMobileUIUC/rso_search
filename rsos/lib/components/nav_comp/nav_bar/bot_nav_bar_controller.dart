import 'package:get/get.dart';

class BotNavBarController extends GetxController {

  var navIndex = 0.obs;

  void changeNavPage(int index) {
    navIndex.value = index;
  }

}