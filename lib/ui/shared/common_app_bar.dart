import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:teno/core/constant/app_colors.dart';
import 'package:teno/core/constant/app_icons.dart';
import 'package:teno/core/constant/app_images.dart';
import 'package:teno/core/utils/app_config.dart';
import 'package:teno/core/utils/globle.dart';
import 'package:teno/ui/screen/base_screen/controller/base_controller.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height < 700
            ? getHeight(125)
            : getHeight(140),
        child: Column(
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height < 700
                    ? getHeight(120)
                    : getHeight(135),
                color: AppColor.appBarColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      AppIcons.menu,
                      height: 36,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 43,
                      width: 43,
                      decoration: const BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40)),
                            child: SizedBox(
                              width: 38,
                              height: 38,
                              child: Image.asset(
                                AppImage.dummyProfile,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "John Doe",
                          style: TextStyle(
                            fontFamily: Font.kRifficFree,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset(AppIcons.star),
                            const SizedBox(
                              width: 3,
                            ),
                            Image.asset(AppIcons.tenInt)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GetBuilder(
                      builder: (BaseController baseController) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            modeText(
                                cashMode: baseController.cashMode,
                                index: 0,
                                title: "Cash Mode"),
                            const SizedBox(
                              height: 2,
                            ),
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Container(
                                width: 22,
                                height: 41,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    modeButton(
                                      index: 0,
                                      cashMode: baseController.cashMode,
                                      onTap: () {
                                        baseController.cashMode = 0;
                                      },
                                    ),
                                    modeButton(
                                      index: 1,
                                      cashMode: baseController.cashMode,
                                      onTap: () {
                                        baseController.cashMode = 1;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    )
                                  ],
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            modeText(
                                index: 1,
                                cashMode: baseController.cashMode,
                                title: "Free Mode"),
                          ],
                        );
                      },
                    ),
                    const Spacer(),
                    Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          height: 25,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "Rs.",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "2456",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Positioned(
                          right: -30,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                AppImage.greenC,
                                height: 60,
                                width: 60,
                              ),
                              Positioned(
                                  bottom: 21,
                                  left: 21,
                                  child: Image.asset(AppIcons.circlePlus))
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}

modeText({required int index, required int cashMode, required String title}) {
  return Text(
    title,
    style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 8,
        color: cashMode == index ? Colors.white : Colors.white.withOpacity(.5)),
  );
}

modeButton(
    {required int index,
    required int cashMode,
    required void Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 17,
      width: 17,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: cashMode == index ? Colors.blue : Colors.transparent),
    ),
  );
}
