import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:teno/core/constant/app_colors.dart';
import 'package:teno/core/constant/app_images.dart';
import 'package:teno/core/utils/app_config.dart';
import 'package:teno/core/utils/globle.dart';
import 'package:teno/ui/screen/base_screen/controller/base_controller.dart';
import 'package:teno/ui/screen/home_screen/controller/home_screen_controller.dart';
import 'package:teno/ui/screen/leader_board/leader_board_screen.dart';
import 'package:teno/ui/shared/common_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController homeScreenController = Get.find<HomeScreenController>();
  BaseController baseController = Get.find<BaseController>();
  CarouselController recentlyPlayedController = CarouselController();
  CarouselController trendingSliderController = CarouselController();

  @override
  void initState() {
    homeScreenController.typeOfQuizList = quizName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List trendingList = [trending1(), trending2(), trending3()];
    List recentlyList = [recentlyBox1(), recentlyBox2(), recentlyBox3()];
    return Stack(
      children: [
        body(recentlyList, trendingList, context),
        const CommonAppBar(),
      ],
    );
  }

  body(List<dynamic> recentlyList, List<dynamic> trendingList,
      BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/background.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: getHeight(150),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: List.generate(
                    homeScreenController.quizDetailsList.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: SizedBox(
                          height: getHeight(180),
                          width: getWidth(135),
                          child: Stack(
                            children: [
                              Image.asset(
                                homeScreenController
                                    .quizDetailsList[index].image,
                                fit: BoxFit.cover,
                                height: getHeight(180),
                                width: getWidth(135),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 5,
                                left: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      homeScreenController
                                          .quizDetailsList[index].name,
                                      style: const TextStyle(
                                          fontFamily: Font.kMontserrat,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    LinearPercentIndicator(
                                      animation: true,
                                      lineHeight: 6.0,
                                      animationDuration: 2000,
                                      percent: 0.8,
                                      linearStrokeCap: LinearStrokeCap.roundAll,
                                      progressColor: const Color(0xFFeb8a49),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "8.9/10",
                                      style: TextStyle(
                                          fontFamily: Font.kMontserrat,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GetBuilder(
              builder: (HomeScreenController homeScreenController) {
                return homeScreenController.selectedTitleQuiz != ""
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          height: getHeight(58),
                          child: Center(
                              child: Text(
                            homeScreenController.selectedTitleQuiz,
                            style: TextStyle(
                                fontSize: getWidth(27),
                                fontWeight: FontWeight.bold),
                          )),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xFF54FFB5), width: 2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              gradient: const LinearGradient(colors: [
                                Color(0xFFEC4747),
                                Color(0xFFA7131D)
                              ])),
                        ),
                      )
                    : Container();
              },
            ),
            GetBuilder(
              builder: (HomeScreenController homeScreenController) {
                return homeScreenController.selectedTitleQuiz != ""
                    ? const SizedBox(
                        height: 25,
                      )
                    : Container();
              },
            ),
            GetBuilder(
              builder: (HomeScreenController homeScreenController) {
                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 15,
                  runSpacing: 15,
                  direction: Axis.horizontal,
                  children: List.generate(
                    homeScreenController.typeOfQuizList.length,
                    (index) => GestureDetector(
                      onTap: () {
                        homeScreenController.selectedListQuiz(
                            homeScreenController.typeOfQuizList[index]);
                      },
                      child: Container(
                        height: getHeight(42),
                        width: getWidth(106),
                        child: Center(
                            child: Text(
                          homeScreenController.typeOfQuizList[index]
                              .toUpperCase(),
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          gradient: const LinearGradient(colors: [
                            Color(0xFF0A69D0),
                            Color(0xFF053568),
                          ]),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Wrap(
              spacing: 15,
              runSpacing: 15,
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              children: List.generate(
                homeScreenController.adsBanner.length,
                (index) => GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Get.toNamed(LeaderBoardScreen.routeName);
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        child: Container(
                          width: 95,
                          height: 117,
                          decoration: kInnerDecoration,
                        ),
                        decoration: kGradientBoxDecoration,
                      ),
                      Image.asset(
                        homeScreenController.adsBanner[index],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Recently Played",
              style: TextStyle(
                color: Color(0xFF0E65C6),
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CarouselSlider(
              carouselController: recentlyPlayedController,
              options: CarouselOptions(
                viewportFraction: .4,
                pageSnapping: true,
                disableCenter: true,
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: recentlyList.map(
                (customWidget) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        // width: 300,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 1.0),
                        decoration: const BoxDecoration(),
                        child: customWidget,
                      );
                    },
                  );
                },
              ).toList(),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Trending Tournament",
              style: TextStyle(
                color: Color(0xFF0E65C6),
                fontWeight: FontWeight.bold,
                fontSize: 29,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CarouselSlider(
              carouselController: trendingSliderController,
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: trendingList.map((customWidget) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 1.0),
                  decoration: const BoxDecoration(),
                  child: customWidget,
                );
              }).toList(),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              color: Color(0XFFF3F3F3),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Leader Board".toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF0E65C6),
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GetBuilder(
                    builder: (HomeScreenController homeScreenController) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          homeScreenController.quizResult.length,
                          (index) => GestureDetector(
                            onTap: () {
                              homeScreenController.quizResultSelected = index;
                            },
                            child: Container(
                              height: 50,
                              width: Get.width / 3,
                              decoration: BoxDecoration(
                                  color:
                                      homeScreenController.quizResultSelected ==
                                              index
                                          ? AppColor.backgroundColor
                                          : Color(0XFFF3F3F3),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      topLeft: Radius.circular(30))),
                              child: Center(
                                child: Text(
                                  homeScreenController.quizResult[index],
                                  style: TextStyle(
                                    fontSize: homeScreenController
                                                .quizResultSelected ==
                                            index
                                        ? 19
                                        : 14,
                                    color: homeScreenController
                                                .quizResultSelected ==
                                            index
                                        ? Color(0XFFF3F3F3)
                                        : AppColor.backgroundColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: AppColor.backgroundColor,
              height: 147,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  rankBox(colors: [
                    const Color(0xffA07E66),
                    const Color(0xff5E3A2F)
                  ], width: 70, height: 86, fontSize: 15),
                  rankBox(colors: [
                    const Color(0xffFBB03B),
                    const Color(0xffD4622A)
                  ], width: 87, height: 105, fontSize: 18),
                  rankBox(colors: [
                    const Color(0xffF2F2F2),
                    const Color(0xff4E4E4E)
                  ], width: 70, height: 86, fontSize: 18),
                  const SizedBox(
                    width: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  rankBox({
    required List<Color> colors,
    required double width,
    required double height,
    required double fontSize,
  }) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "John Doe",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: Font.kPoppins,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400),
            ),
            const Text(
              "Cash Won: Rs.4500",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                fontFamily: Font.kPoppins,
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          gradient: LinearGradient(colors: colors),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }

  trending1() {
    return trendingBox(
        image: const AssetImage(AppImage.trending1),
        color: const Color(0xFF19Edc1));
  }

  trending2() {
    return trendingBox(
      image: const AssetImage(AppImage.trending2),
      color: const Color(0xFFFED812),
    );
  }

  trending3() {
    return trendingBox(
      image: const AssetImage(AppImage.trending3),
      color: const Color(0xFFFF5666),
    );
  }

  Widget recentlyBox1() {
    return recentlyBox(image: "assets/image/Group 2601.png");
  }

  Widget recentlyBox2() {
    return recentlyBox(image: "assets/image/1-02.png",onTap: () {
      Get.toNamed(LeaderBoardScreen.routeName);
    },);
  }

  Widget recentlyBox3() {
    return recentlyBox(image: "assets/image/Group 2602.png");
  }

  recentlyBox({required String image, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/Group 2599.png"),
              ),
            ),
          )
        ],
      ),
    );
  }

  trendingBox({required ImageProvider image, required Color color}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: image, fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: color,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 34),
                child: Text(
                  "Angular Js",
                  style: TextStyle(
                      fontFamily: Font.kPoppins,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Text(
                    "Players in pool:",
                    style: TextStyle(
                        fontFamily: Font.kPoppins,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 13),
                  ),
                  Text(
                    "231/350",
                    style: TextStyle(
                        fontFamily: Font.kPoppins,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 13),
                  )
                ],
              ),
              Column(
                children: const [
                  Text(
                    "Price Money",
                    style: TextStyle(
                        fontFamily: Font.kPoppins,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 13),
                  ),
                  Text(
                    "Rs. 500",
                    style: TextStyle(
                        fontFamily: Font.kPoppins,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 13),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

final kInnerDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.white),
  borderRadius: BorderRadius.circular(32),
);

final kGradientBoxDecoration = BoxDecoration(
  gradient:
      const LinearGradient(colors: [Color(0xFFDED9D6), Color(0xFF8B878D)]),
  border: Border.all(color: Colors.transparent, width: 3),
  borderRadius: BorderRadius.circular(32),
);
