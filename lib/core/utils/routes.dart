import 'package:get/get.dart';
import 'package:teno/ui/screen/base_screen/base_screen.dart';
import 'package:teno/ui/screen/leader_board/leader_board_screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: BaseScreen.routeName, page: () => const BaseScreen()),
  GetPage(
      name: LeaderBoardScreen.routeName, page: () => const LeaderBoardScreen()),
];
