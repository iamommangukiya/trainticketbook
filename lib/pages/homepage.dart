// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'Profile.dart';
import 'bokked.dart';
import 'componments/bottomnavigationbar.dart';
import 'serchpage.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  BottomnavigationbarController bottomnavigationbarController =
      Get.put(BottomnavigationbarController());
  final screens = [
    Serch_page(),
    BokkedTickets(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 208, 208, 208),
      extendBody: true,
      body: Obx(
        () => IndexedStack(
          children: screens,
          index: bottomnavigationbarController.selectdindex.value,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 300),
        color: Color.fromARGB(244, 164, 164, 164),
        animationCurve: Curves.easeInSine,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color.fromARGB(244, 164, 164, 164),
        items: <Widget>[
          Image(image: AssetImage("lib/images/home.png"), height: 40),
          Image(image: AssetImage("lib/images/ticket.png"), height: 40),
          Image(image: AssetImage("lib/images/user.png"), height: 40),
        ],
        onTap: (index) {
          bottomnavigationbarController.selectdindex(index);
        },
      ),
    );
  }
}
