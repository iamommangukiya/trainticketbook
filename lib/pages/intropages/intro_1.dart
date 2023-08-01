import 'package:flutter/material.dart';

class In_1 extends StatelessWidget {
  const In_1({super.key});

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
                    image: AssetImage("lib/images/image1.png"),
                    height: 250,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ready To Travel",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Choose your destination, plan your trip.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Pick the best train for traveling",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
