// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import './pages/componments/bottomnavigationbar.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'pages/Singinpage.dart';
import 'pages/componments/Tfild.dart';
import 'pages/componments/my_btn.dart';
import 'pages/homepage.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  BottomnavigationbarController bottomnavigationbarController =
      Get.put(BottomnavigationbarController());

  final usernamcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                //logo
                Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "welcome back You've been missed!",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                const SizedBox(
                  height: 25,
                ),
                Tfield(
                    controller: usernamcontroller,
                    hintext: "username",
                    obssecuretext: false),
                const SizedBox(
                  height: 25,
                ),
                Tfield(
                    controller: passwordcontroller,
                    hintext: "Password",
                    obssecuretext: true),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text("forget Password!"),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                My_btn(
                  onTap: () {
                    Get.to(Homepage(),
                        transition: Transition.fade,
                        duration: Duration(seconds: 1));
                    bottomnavigationbarController.selectdindex(0);
                  },
                ),

                //password
                //singinbtn

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GestureDetector(
                      child: Text(
                        "create account!",
                      ),
                      onTap: () => {
                            Get.to(SingINpage(),
                                transition: Transition.fade,
                                duration: Duration(seconds: 1)),
                          }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
