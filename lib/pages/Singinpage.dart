import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Login _page.dart';
import 'componments/Tfild.dart';
import 'componments/my_btn.dart';

class SingINpage extends StatelessWidget {
  SingINpage({super.key});
  final usernamcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final cpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: SingleChildScrollView(
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
                  "welcome Create account!",
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
                  height: 25,
                ),
                Tfield(
                    controller: passwordcontroller,
                    hintext: "Conform Password",
                    obssecuretext: true),

                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Loginpage(),
                        transition: Transition.fade,
                        duration: Duration(seconds: 1));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  child: const Text("Login!"),
                  onTap: () {
                    Get.to(Loginpage(),
                        transition: Transition.fade,
                        duration: Duration(seconds: 1));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
