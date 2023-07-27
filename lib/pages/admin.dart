import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';

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
  TextEditingController _tStartController = TextEditingController();
  TextEditingController _placeToController = TextEditingController();
  TextEditingController _placeFromController = TextEditingController();
  TextEditingController _tEndController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  String? _fromselectedCity;
  String? tname;

  String? _selectedCity;
  TextEditingController _dateController = TextEditingController();

  void _submitData() {
    final firestoreInstance = FirebaseFirestore.instance;
    String timestart = _tStartController.text;
    String timeend = _tEndController.text;
    String date = _dateController.text;
    String? tnmae1 = tname;
    String? placeTo = _selectedCity;
    String? placeFrom = _fromselectedCity;
    String price = _priceController.text;

    if (timestart.isEmpty && price.isEmpty && timeend.isEmpty) {
      Get.snackbar("Please Fill All Fields ", "Empty fields");
    } else {
      firestoreInstance.collection('newtdata').add({
        'date': date,
        'timestart': timestart,
        'timeend': timeend,
        'tname': tnmae1,
        'price': price,
        'placeFrom': placeFrom,
        'placeTo': placeTo,
      }).then((value) {
        Get.snackbar("data added successfuly", "Done");
        _priceController.clear();
        _placeFromController.clear();
        _selectedCity = null;
        _fromselectedCity = null;
        _tEndController.clear();
        _placeToController.clear();
        _tStartController.clear();
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
                  DateTimePicker(
                    type: DateTimePickerType.date,
                    controller: _dateController,
                    dateMask: 'yyyy-MM-dd',
                    decoration: InputDecoration(
                      labelText: 'Date',
                    ),
                    firstDate: DateTime(2000),
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
                  SizedBox(height: 16),
                  DateTimePicker(
                    type: DateTimePickerType.time,
                    controller: _tStartController,
                    timeLabelText: 'Start Time',
                    onChanged: (val) =>
                        setState(() => _tStartController.text = val),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Start Time field is required.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  DateTimePicker(
                    type: DateTimePickerType.time,
                    controller: _tEndController,
                    timeLabelText: 'End Time',
                    onChanged: (val) =>
                        setState(() => _tEndController.text = val),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'End Time field is required.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
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
                  SizedBox(height: 16),
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
