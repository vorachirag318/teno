import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teno/core/constant/app_images.dart';
import 'package:teno/core/utils/app_config.dart';
import 'package:teno/ui/screen/leader_board/controller/leader_board_controller.dart';
import 'package:teno/ui/shared/common_app_bar.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);
  static const String routeName = "/leaderBoardScreen";

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  LeaderBoardController leaderBoardController =
      Get.find<LeaderBoardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          body(),
          appBarScroll(),
          const CommonAppBar(),
        ],
      ),
    );
  }

  body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 230,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  leaderBoardController.gameList.length,
                  (index) =>
                      gameImageBox(leaderBoardController.gameList[index])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Row(
                  children: [
                    text(
                        color: const Color(0xFFDE2C38),
                        fontSize: 21,
                        fontColor: Colors.white,
                        title: "Solo"),
                    text(
                        color: Colors.white,
                        fontSize: 15,
                        fontColor: const Color(0xFFC4C4C4),
                        title: "Verses"),
                    text(
                        color: Colors.white,
                        fontSize: 15,
                        fontColor: const Color(0xFFC4C4C4),
                        title: "Table")
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xFF42D3F1), width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
          ),
          Column(
            children: List.generate(
                10, (index) => price(rs: " Rs. 100", entryFee: "100")),
          )
        ],
      ),
    );
  }

  Container appBarScroll() {
    return Container(
      height: getHeight(240),
      child: Padding(
        padding: EdgeInsets.only(
          top: getHeight(120),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            changeButton(
              Icons.arrow_back_ios,
            ),
            SizedBox(
              width: 150,
              child: Image.asset(AppImage.abcd2),
            ),
            changeButton(Icons.arrow_forward_ios)
          ],
        ),
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFEDEDED),
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
    );
  }

  changeButton(IconData icon) {
    return CircleAvatar(
      radius: 13,
      backgroundColor: const Color(0xFFB4B4B4),
      child: Center(
          child: Icon(
        icon,
        size: 15,
        color: Colors.white,
      )),
    );
  }

  text(
      {required Color fontColor,
      required double fontSize,
      required Color color,
      required String title}) {
    return Expanded(
      child: Container(
        color: color,
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: fontColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  gameImageBox(String image) {
    return SizedBox(
      height: 135,
      width: 95,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }

  price({required String rs, required String entryFee}) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 30),
      child: Row(
        children: [
          Stack(children: [
            Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  color: Colors.white,
                  border: Border.all(color: Color(0xFFDE2C38), width: 3)),
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Prize:',
                        style: TextStyle(
                            color: Color(0xFF064992),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      rs,
                      style: TextStyle(
                          color: Color(0xFF064992),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 190),
              child: Container(
                height: 65,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    color: const Color(0xFF0A69D0),
                    border: Border.all(color: Colors.white, width: 3)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Entry:',
                          style: TextStyle(
                              color: Color(0xFFFFD014),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          entryFee,
                          style: const TextStyle(
                              color: Color(0xFFFFD014),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Life lines: 0',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}
