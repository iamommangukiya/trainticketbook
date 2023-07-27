// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:railway/componments/bottomnavigationbar.dart';
import 'package:railway/componments/liste.dart';
import 'package:railway/pages/result.dart';

class Serch_page extends StatefulWidget {
  const Serch_page({super.key});

  @override
  State<Serch_page> createState() => _Serch_pageState();
}

class _Serch_pageState extends State<Serch_page> {
  String? _selectedCity;
  String? _fromselectedCity;
  TextEditingController _fromcontroller = TextEditingController();
  TextEditingController _tocontroller = TextEditingController();
  BottomnavigationbarController bottomnavigationbarController =
      Get.put(BottomnavigationbarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      extendBody: true,

      // bottomNavigationBar: DotNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              // color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Railway",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Book Train Tickets",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        bottomnavigationbarController.selectdindex(2);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                // image: AssetImage("./assets/profile.jpg"),
                                image: AssetImage("lib/images/profile.jpg")),
                            // color: Colors.red,

                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin: EdgeInsets.symmetric(horizontal: 40),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'place to'),
                    value: _selectedCity,
                    items: const [
                      DropdownMenuItem(
                          value: "Ahemdabad", child: Text("Ahemdabad")),
                      DropdownMenuItem(value: "Amreli", child: Text("Amreli")),
                      DropdownMenuItem(
                          value: "Bhavnagar", child: Text("Bhavnagar")),
                      DropdownMenuItem(
                          value: "Bharuch", child: Text("Bharuch")),
                      DropdownMenuItem(value: "Bhuj", child: Text("Bhuj")),
                      DropdownMenuItem(value: "Dwarka", child: Text("Dwarka")),

                      DropdownMenuItem(value: "Godhra", child: Text("Godhra")),
                      // Add more cities here
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedCity = value.toString();
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'City field is required.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "To",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'place from'),
                    value: _fromselectedCity,
                    items: [
                      DropdownMenuItem(value: "Surat", child: Text("surat")),
                      DropdownMenuItem(
                          value: "Planpur", child: Text("palanpur")),
                      DropdownMenuItem(value: "Mumbai", child: Text("Mumbai")),
                      DropdownMenuItem(
                          value: "Kanyakumari", child: Text("Kanyakumari")),
                      DropdownMenuItem(
                          value: "Tamilnadu", child: Text("Tamilnadu")),
                      DropdownMenuItem(value: "MP", child: Text("Mp")),

                      DropdownMenuItem(
                          value: "Kashmir", child: Text("Kashmir")),
                      // Add more cities here
                    ],
                    onChanged: (value) {
                      setState(() {
                        _fromselectedCity = value.toString();
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'City field is required.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        if (_selectedCity!.isEmpty &&
                            _fromselectedCity!.isEmpty) {
                          Get.snackbar(
                              "Enter valid details", "Empty fild not allowd");
                        } else {
                          Get.to(
                              Result_page(
                                  inFromcity: _fromselectedCity.toString(),
                                  intoCity: _selectedCity.toString()),
                              transition: Transition.fade,
                              duration: Duration(seconds: 1));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            "SEARCH",
                            style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              child: Text(
                "Recommendations",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),
            Listcard(
              visible: false,
              placefrom: "Delhi",
              placeto: "mumbai",
              timestart: "8:00AM",
              timeend: "9:00Pm",
              traname: "rajdhani",
              price: "700",
            ),
          ]),
        ),
      ),
    );
  }
}
