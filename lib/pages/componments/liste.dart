import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Book.dart';

class Listcard extends StatefulWidget {
  const Listcard({super.key});

  @override
  State<Listcard> createState() => _ListcardState();
}

class _ListcardState extends State<Listcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: FlutterTicketWidget(
        isCornerRounded: true,
        child: Container(
          // color: Colors.grey,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: Colors.grey),
            // borderRadius: BorderRadius.circular(10)
          ),
          // margin: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tickets",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "\$300",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Delhi",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Image(
                    image: AssetImage("lib/images/two-arrows.png"),
                    color: Color.fromARGB(255, 73, 61, 26),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Mumbai",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      "8:00AM",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Image(
                      image: AssetImage("lib/images/delete.png"),
                      width: 15,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "3:00PM",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(Book(),
                      transition: Transition.fade,
                      duration: Duration(seconds: 1));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    "Book",
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
