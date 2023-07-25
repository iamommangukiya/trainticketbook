// ignore_for_file: depend_on_referenced_packages, unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../componments/Tfield.dart';

class SingINpage extends StatelessWidget {
  SingINpage({super.key});
  final usernamcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final cpasswordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  //logo
                  Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "welcome Create account!",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Tfield(
                    valistring: "Enter the usename",
                    controller: usernamcontroller,
                    hintext: "email",
                    obssecuretext: false,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Tfield(
                      valistring: "Enter The Password",
                      controller: passwordcontroller,
                      hintext: "Password",
                      obssecuretext: true),
                  const SizedBox(
                    height: 25,
                  ),
                  Tfield(
                      valistring: "Enter The Password",
                      controller: cpasswordcontroller,
                      hintext: "Conform Password",
                      obssecuretext: true),

                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (passwordcontroller.text == cpasswordcontroller.text) {
                        if (formkey.currentState!.validate()) {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: usernamcontroller.text,
                                  password: passwordcontroller.text)
                              .then((value) {
                            FirebaseFirestore.instance
                                .collection("login")
                                .doc(value.user!.uid)
                                .set({
                              "id": value.user!.uid,
                              "name": usernamcontroller.text,
                              "pass": passwordcontroller.text,
                            });
                          });
                        }
                      } else {
                        Get.snackbar(
                          "Password",
                          "password Dose not match",
                          colorText: const Color.fromARGB(255, 0, 0, 0),
                          dismissDirection: DismissDirection.horizontal,
                          icon: const Icon(Icons.warning),
                        );
                      }
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
                          "Create Account",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: const Text("Login!"),
                    onTap: () {
                      // Get.to(Loginpage(),
                      //     transition: Transition.fade,
                      //     duration: Duration(seconds: 1));
                    },
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
