import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teno/core/constant/app_colors.dart';
import 'package:teno/core/utils/app_config.dart';
import 'package:teno/core/utils/globle.dart';
import 'package:teno/ui/screen/base_screen/controller/base_controller.dart';

class BaseScreen extends StatefulWidget {
  static const String routeName = "/baseScreen";
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: GetBuilder(
        builder: (BaseController controller) => IndexedStack(
          children: navigationScreens,
          index: controller.selectedTab,
        ),
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }

  bottomBar(BuildContext context) {
    return BottomAppBar(
      elevation: 3,
      child: GetBuilder(
        builder: (BaseController baseController) => Row(
          children: navigationTabList
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        baseController.selectedTab = key;
                      },
                      child: Container(
                        color: AppColor.backgroundColor,
                        height: 85,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 2,
                                color: Color(0xFFDE2C38),
                              ),
                              SizedBox(height: 8,),
                              Text(
                                value.name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 8.5),
                              ),
                              Container(
                                height: 51,
                                width: 49,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Image.asset(
                                    baseController.selectedTab == key
                                        ? value.selectedTabImage
                                        : value.unSelectedTabImage),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}
