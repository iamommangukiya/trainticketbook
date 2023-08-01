import 'package:flutter/material.dart';

class In_2 extends StatelessWidget {
  const In_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("lib/images/image2.png"),
                    height: 250,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Select The Date",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Select the dat.pick your ticket. we give",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "you the best price .we guaranted!s",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
