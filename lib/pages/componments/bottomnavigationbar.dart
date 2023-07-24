import 'package:get/get.dart';

class BottomnavigationbarController extends GetxController {
  var selectdindex = 0.obs;
  var textvalue = 0.obs;
  void cahngeIndex(int index) {
    selectdindex.value = index;
  }

  void incresvalue() {
    textvalue.value++;
  }
}
