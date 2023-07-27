import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Trip {
  final String fromcity;
  final String tocity;
  final String price;
  final String date;
  final String endtime;
  final String trainname;
  final String starttime;

  Trip(
      {required this.date,
      required this.endtime,
      required this.starttime,
      required this.fromcity,
      required this.trainname,
      required this.price,
      required this.tocity,
      required});
}

Stream<List<Trip>> getTripsStream() {
  return FirebaseFirestore.instance
      .collection('bookdata')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Trip(
                date: doc['date'],
                endtime: doc['timeend'],
                starttime: doc['timestart'],
                fromcity: doc['placeFrom'],
                tocity: doc['placeTo'],
                price: doc['price'],
                trainname: doc['tname'],
              ))
          .toList());
}

class Bticket extends StatefulWidget {
  const Bticket({super.key});

  @override
  State<Bticket> createState() => _BticketState();
}

class _BticketState extends State<Bticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
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
                        "Railway",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "₹ " + Trip,
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
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
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
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
                  Text(
                    Date,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
        ),
      ]),
    );
  }
}
