import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int indexvalue) {
    currentIndex.value = indexvalue;
  }
}
