import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:railway/pages/Book.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';

class Listcard extends StatelessWidget {
  final String placefrom;
  final String placeto;
  final String Date;
  final bool visible;
  final String timestart;
  final String timeend;

  final String price;

  final String traname;

  const Listcard(
      {super.key,
      required this.placefrom,
      required this.placeto,
      required this.price,
      required this.traname,
      required this.timestart,
      required this.timeend,
      required this.visible,
      required this.Date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Container(
        // height: 300,
        // width: 300,
        // isCornerRounded: true,
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
                    traname,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    price,
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
                    placefrom,
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
                  Expanded(
                    child: Text(
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      placeto,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      timestart,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const Image(
                      image: AssetImage("lib/images/delete.png"),
                      width: 15,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      timeend,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: visible,
                child: GestureDetector(
                  onTap: () {
                    Get.to(const Book(),
                        transition: Transition.fade,
                        duration: Duration(seconds: 1));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: const Text(
                      "Book",
                      style: TextStyle(fontSize: 25),
                    ),
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
