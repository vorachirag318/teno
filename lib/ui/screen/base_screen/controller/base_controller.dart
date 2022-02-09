import 'package:get/get.dart';

class BaseController extends GetxController {
  int _selectedTab = 2;

  int get selectedTab => _selectedTab;

  set selectedTab(int value) {
    _selectedTab = value;
    update();
  }

  int _cashMode = 0;

  int get cashMode => _cashMode;

  set cashMode(int value) {
    _cashMode = value;
    update();
  }
}
