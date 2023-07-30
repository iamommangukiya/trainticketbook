import 'dart:ffi';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:railway/pages/Book.dart';
import 'package:railway/pages/bookticket.dart';
import 'package:railway/pages/homepage.dart';

class Update_tic extends StatefulWidget {
  final Map<String, dynamic> ticketData;

  Update_tic({super.key, required this.ticketData});

  @override
  State<Update_tic> createState() => _Update_ticState();
}

class _Update_ticState extends State<Update_tic> {
  TextEditingController _dateController = TextEditingController();

  void _submitData() {
    String date = _dateController.text;
    if (date.isNotEmpty) {
      // Update the date in Firestore
      updateDateInFirestore(widget.ticketData['documentId'], date);
    }
  }

  void updateDateInFirestore(String documentId, String newDate) async {
    try {
      // Replace 'your_collection_name' with the actual name of your collection in Firestore
      await FirebaseFirestore.instance
          .collection('bookdata')
          .doc(documentId)
          .update({'date': newDate});
      print('Date updated successfully.');
    } catch (e) {
      print('Error updating date. Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Update Ticket",
                    style: GoogleFonts.abel(
                        fontSize: 25,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(widget.ticketData['date']),
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
                            widget.ticketData["tname"],
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "₹ " + widget.ticketData["price"],
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
                            widget.ticketData["placeFrom"],
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
                              widget.ticketData["placeTo"].toString(),
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
                              widget.ticketData["timestart"],
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
                              widget.ticketData["timeend"],
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.ticketData["date"],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Update Date",
                        style: GoogleFonts.roboto(fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      DateTimePicker(
                        type: DateTimePickerType.date,
                        controller: _dateController,
                        dateMask: 'yyyy-MM-dd',
                        decoration: InputDecoration(
                          labelText: 'Date',
                        ),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        onChanged: (val) =>
                            setState(() => _dateController.text = val),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Date field is required.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Visibility(
                          visible: true,
                          child: GestureDetector(
                            onTap: () {
                              _submitData();
                              Get.to(Homepage(),
                                  transition: Transition.fade,
                                  duration: Duration(seconds: 1));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: const Text(
                                "Update",
                                style: TextStyle(fontSize: 20),
                              ),
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
        ),
      ),
    );
  }
}
