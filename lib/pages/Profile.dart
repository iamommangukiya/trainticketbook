import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Login _page.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        // image: AssetImage("./assets/profile.jpg"),
                        image: AssetImage("lib/images/profile.jpg")),
                    // color: Colors.red,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Name: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Om Mangukiya",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Email: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    "Ommangukiya10123@gmail.com",
                    style: TextStyle(fontSize: 20, overflow: TextOverflow.clip),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                Get.to(Loginpage(),
                    transition: Transition.upToDown,
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
                    "Logout!",
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
          ],
        ),
      ))),
    );
  }
}
