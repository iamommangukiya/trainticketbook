import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:railway/pages/homepage.dart';
import 'package:railway/pages/main_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 7),
      () {
        Get.to(Main_page());
      },
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset("lib/images/animation_lksqe941.json", height: 500),
            SizedBox(
              child: TextLiquidFill(
                text: 'RAILWAY',
                waveColor: Color.fromARGB(255, 34, 12, 80),
                boxBackgroundColor: Colors.white,
                textStyle: GoogleFonts.alatsi(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
