import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../componments/Tfield.dart';
import '../componments/bottomnavigationbar.dart';
import 'homepage.dart';
import '../componments/my_btn.dart';
import 'Singinpage.dart';

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
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  //logo
                  Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "welcome back You've been missed!",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Tfield(
                      valistring: "enter user name",
                      controller: usernamcontroller,
                      hintext: "username",
                      obssecuretext: false),
                  SizedBox(
                    height: 25,
                  ),
                  Tfield(
                      valistring: "enter the password",
                      controller: passwordcontroller,
                      hintext: "Password",
                      obssecuretext: true),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text("forget Password!"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  My_btn(
                    onTap: () {
                      Get.to(const Homepage(),
                          transition: Transition.fade,
                          duration: Duration(seconds: 1));
                      bottomnavigationbarController.selectdindex(0);
                    },
                  ),

                  //password
                  //singinbtn

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
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
      ),
    );
  }
}
