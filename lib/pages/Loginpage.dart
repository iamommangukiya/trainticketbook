import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railway/pages/admin.dart';

import '../componments/Tfield.dart';
import '../componments/bottomnavigationbar.dart';
import 'homepage.dart';
import '../componments/my_btn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Singinpage.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  BottomnavigationbarController bottomnavigationbarController =
      Get.put(BottomnavigationbarController());
  final usernamcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    if (usernamcontroller.text == "admin" &&
        passwordcontroller.text == "admin") {
      Get.to(AdminPage(),
          transition: Transition.upToDown,
          duration: Duration(milliseconds: 500));
    } else {
      try {
        // Get the email and password from the TextEditingControllers
        String email = usernamcontroller.text.trim();
        String password = passwordcontroller.text;

        // Use FirebaseAuth to sign in with email and password
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        // If sign-in is successful, userCredential.user will not be null.
        // You can do additional tasks here, like navigating to the home page.
        if (userCredential.user != null) {
          bottomnavigationbarController.cahngeIndex(0);
          print('Sign in successful');
          Get.to(Homepage(),
              transition: Transition.downToUp,
              duration: Duration(milliseconds: 500));
        }
      } catch (e) {
        // Handle sign-in errors, e.g., wrong password, user not found, etc.
        Get.snackbar("Username or password inccorect", "Authentication");
        // You can show a snackbar or dialog to display the error message to the user.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  //logo
                  Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "welcome back You've been missed!",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Tfield(
                      valistring: "enter user name",
                      controller: usernamcontroller,
                      hintext: "username",
                      obssecuretext: false),
                  SizedBox(
                    height: 25,
                  ),
                  Tfield(
                      valistring: "enter the password",
                      controller: passwordcontroller,
                      hintext: "Password",
                      obssecuretext: true),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text("forget Password!"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  My_btn(onTap: () {
                    _signInWithEmailAndPassword(context);
                  }),

                  //password
                  //singinbtn

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                        child: Text(
                          "create account!",
                        ),
                        onTap: () => {
                              Get.to(SingINpage(),
                                  transition: Transition.fadeIn,
                                  duration: Duration(milliseconds: 500))
                            }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  // void _signInWithEmailAndPassword()async {
  //    await Firebase.initializeApp();
  //    User? user=   FirebaseAuth.instance.signInWithEmailAndPassword(email: usernamcontroller.text.trim(), password: passwordcontroller.text.trim()) as User?;
  //
  //    if(user != null){
  //      // Get.to(Homepage(),transition: Transition.fadeIn, duration: Duration(milliseconds: 500) ) ;
  //    }
  //    else{
  //      Get.snackbar("Username or password incorrect" , "plese correct");
  //    }
}
