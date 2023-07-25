import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:railway/pages/Loginpage.dart';
import 'package:railway/pages/homepage.dart';

class Main_page extends StatelessWidget {
  const Main_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while checking the authentication status.
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else {
          if (snapshot.hasData) {
            print("datahas");
            // User is already signed in, navigate to home page.
            return Homepage();
          } else {
            print("nodata");
            // User is not signed in, navigate to login page.
            return Loginpage();
          }
        }
      },
    );
  }
}
