import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:neon/neon.dart';
import 'package:railway/pages/Loginpage.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

const neonGreyColor = MaterialColor(
  _neonGreyPrimaryValue,
  <int, Color>{
    50: Color(_neonGreyPrimaryValue),
    100: Color(_neonGreyPrimaryValue),
    200: Color(_neonGreyPrimaryValue),
    300: Color(_neonGreyPrimaryValue),
    400: Color(_neonGreyPrimaryValue),
    500: Color(_neonGreyPrimaryValue),
    // 600: Color(_neonGreyPrimaryValue),
    // 700: Color(_neonGreyPrimaryValue),
    // 800: Color(_neonGreyPrimaryValue),
    // 900: Color(_neonGreyPrimaryValue),
  },
);
const int _neonGreyPrimaryValue = 0xFF808080;

class _AdminPageState extends State<AdminPage> {
  TextEditingController _timeController = TextEditingController();
  TextEditingController _placeToController = TextEditingController();
  TextEditingController _placeFromController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  void _submitData() {
    final firestoreInstance = FirebaseFirestore.instance;
    String time = _timeController.text;
    String placeTo = _placeToController.text;
    String placeFrom = _placeFromController.text;
    String price = _priceController.text;

    if (time.isEmpty && placeFrom.isEmpty && placeTo.isEmpty && price.isEmpty) {
      Get.snackbar("Please Fill All Fields ", "Empty fields");
    } else {
      firestoreInstance.collection('tdata').add({
        'name': time,
        'price': price,
        'placeFrom': placeFrom,
        'placeTo': placeTo,
      }).then((value) {
        Get.snackbar("data added successfuly", "Done");
        _priceController.clear();
        _placeFromController.clear();
        _placeToController.clear();
        _timeController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 225, 225),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16),
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Admin",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dancingScript(
                        fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _timeController,
                    decoration: InputDecoration(
                      labelText: 'Time',
                      hintText: 'Enter time',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _placeToController,
                    decoration: InputDecoration(
                        labelText: 'Place To',
                        hintText: 'Enter place to',
                        focusColor: Colors.white),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _placeFromController,
                    decoration: InputDecoration(
                      labelText: 'Place From',
                      hintText: 'Enter place from',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      hintText: 'Enter price',
                    ),
                  ),
                  SizedBox(height: 32),
                  GestureDetector(
                    onTap: () {
                      _submitData();
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
                          "Add Data",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Neon(
                      text: 'railway', // The text you want to make glowing
                      color:
                          neonGreyColor, // The color for the glowing effect (gray)
                      fontSize: 60,
                      font: NeonFont.Cyberpunk,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(Loginpage());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(left: 280),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(59, 0, 0, 0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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
      ),
    );
  }
}
