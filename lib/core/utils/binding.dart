import 'package:get/get.dart';
import 'package:teno/ui/screen/base_screen/controller/base_controller.dart';
import 'package:teno/ui/screen/home_screen/controller/home_screen_controller.dart';
import 'package:teno/ui/screen/leader_board/controller/leader_board_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController(), fenix: true);
    Get.lazyPut<HomeScreenController>(() => HomeScreenController(),
        fenix: true);
    Get.lazyPut<LeaderBoardController>(() => LeaderBoardController(),
        fenix: true);
  }
}
