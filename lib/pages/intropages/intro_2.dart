import 'package:flutter/material.dart';

class In_3 extends StatelessWidget {
  const In_3({super.key});

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
                    image: AssetImage("lib/images/image3.png"),
                    height: 250,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Enjoy Your Trip",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Easy to discovering new places",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "with your friend and travel together.",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
