import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'bokked.dart';
import 'componments/bottomnavigationbar.dart';
import 'componments/liste.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  BottomnavigationbarController bottomnavigationbarController =
      Get.put(BottomnavigationbarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Book Now!",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 41, 41, 41)),
              ),
              Listcard(),
              SizedBox(
                height: 25,
              ),
              Container(
                child: Column(children: []),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(BokkedTickets(),
                      transition: Transition.circularReveal,
                      duration: Duration(seconds: 1));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    "BookFast",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
