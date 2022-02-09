import 'package:flutter/material.dart';
import 'package:teno/core/constant/app_icons.dart';
import 'package:teno/ui/screen/base_screen/base_screen.dart';
import 'package:teno/ui/screen/home_screen/home_screen.dart';
import 'package:teno/ui/shared/common_app_bar.dart';

const String getInitialRoute = BaseScreen.routeName;
final List<NavigationTabContainModel> navigationTabList = [
  NavigationTabContainModel(
      name: "Special Pass",
      selectedTabImage: AppIcons.tab1Red,
      unSelectedTabImage: AppIcons.tab1Blue),
  NavigationTabContainModel(
      name: "Leaderboard",
      selectedTabImage: AppIcons.tab2Red,
      unSelectedTabImage: AppIcons.tab2Blue),
  NavigationTabContainModel(
      name: "Home",
      selectedTabImage: AppIcons.tab3Red,
      unSelectedTabImage: AppIcons.tab3Blue),
  NavigationTabContainModel(
      name: "Features",
      selectedTabImage: AppIcons.tab4Red,
      unSelectedTabImage: AppIcons.tab4Blue),
  NavigationTabContainModel(
      name: "Game Types",
      selectedTabImage: AppIcons.tab5Red,
      unSelectedTabImage: AppIcons.tab5Blue),
];
List<Widget> navigationScreens = const [
  DummyPage(),
  DummyPage(),
  HomeScreen(),
  DummyPage(),
  DummyPage(),
];

class DummyPage extends StatelessWidget {
  const DummyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [CommonAppBar()],
    );
  }
}

class NavigationTabContainModel {
  final String selectedTabImage, unSelectedTabImage, name;

  NavigationTabContainModel(
      {required this.selectedTabImage,
      required this.unSelectedTabImage,
      required this.name});
}

class Font {
  static const String kRifficFree = "RifficFree";
  static const String kObelixPro = "Montserrat";
  static const String kBerlin = "Berlin";
  static const String kMontserrat = "Montserrat";
  static const String kPoppins = "Poppins";
}
