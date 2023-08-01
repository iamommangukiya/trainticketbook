import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railway/pages/Loginpage.dart';
import 'package:railway/pages/intropages/intro_1.dart';
import 'package:railway/pages/intropages/intro_2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intropages/intro_3.dart';

class Intro_page extends StatefulWidget {
  const Intro_page({super.key});

  @override
  State<Intro_page> createState() => _Intro_pageState();
}

class _Intro_pageState extends State<Intro_page> {
  bool lastpage = false;
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              lastpage = (index == 2);
              print(lastpage);
            });
          },
          children: [
            In_1(),
            In_2(),
            In_3(),
          ],
        ),
        Container(
            alignment: Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(fontSize: 20),
                    )),
                SmoothPageIndicator(controller: _controller, count: 3),
                if (lastpage)
                  GestureDetector(
                      onTap: () {
                        Get.to(Loginpage(),
                            transition: Transition.fadeIn,
                            duration: Duration(milliseconds: 500));
                      },
                      child: Text(
                        "done",
                        style: TextStyle(fontSize: 20),
                      )),
                if (lastpage == false)
                  GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 20),
                      ))
              ],
            ))
      ],
    ));
  }
}
