import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:railway/pages/admin.dart';
import 'package:railway/pages/crrditcard.dart';
import 'package:railway/pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart'; // Import the Firebase Core package

import 'pages/Loginpage.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that Flutter is initialized.
  await Firebase.initializeApp(); // Initialize Firebase.
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main_page(),
      // home: Credit_card_page(),
    );
  }
}
