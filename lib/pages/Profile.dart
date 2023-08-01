import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Loginpage.dart';

class Profile extends StatefulWidget {
  final String? userEmail;

  Profile({this.userEmail});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? _profileImageUrl;
  String? _userID;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserProfile();
    // print(super.);
  }

  Future<void> _loadUserProfile() async {
    // Get the current user from FirebaseAuth
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      setState(() {
        _userID = user.uid;
      });

      // Load the profile picture URL from Firestore based on user ID
      try {
        final profileDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(_userID)
            .get();
        if (profileDoc.exists) {
          setState(() {
            _profileImageUrl = profileDoc.data()?['profileImageUrl'];
          });
        }
      } catch (e) {
        print("Error loading profile picture: $e");
      }
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder<User?>(
          future: _getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              User? user = snapshot.data;
              if (user == null) {
                // User is not signed in, show a login button or redirect to login page
                return Text('User not signed in');
              }
              return Center(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: GestureDetector(
                            onTap: () {
                              _pickAndUploadImage();
                            },
                            child: _buildProfilePicture())),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Name: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        // Text(
                        //   'User Email: ${widget.userEmail ?? "Email not available"}',
                        //   softWrap: true,
                        //   style: TextStyle(fontSize: 20),
                        // )
                        Text(' ${user.email ?? 'N/A'}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Email: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            ' ${user.email ?? 'N/A'} ',
                            style: TextStyle(
                                fontSize: 20, overflow: TextOverflow.clip),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        _signOut();
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
                            "Logout!",
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
                  ],
                ),
              ));
            }
          }),
    ));
  }

  Future<void> _signOut() async {
    try {
      // Use FirebaseAuth to sign out the current user
      await FirebaseAuth.instance.signOut();
      Get.to(Loginpage(),
          transition: Transition.upToDown, duration: Duration(seconds: 1));
      Get.snackbar("Logout!", "Logout successfully");
    } catch (e) {
      print('Error occurred while logging out: $e');
    }
  }

  Future<User?> _getUserData() async {
    User? user = _auth.currentUser;
    return user;
  }

  Widget _buildProfilePicture() {
    if (_profileImageUrl == null) {
      // Show circular progress indicator while loading profile picture
      return Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("lib/images/user1.png"),
            radius: 50,
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          ),
          Container(
              child: Icon(
            Icons.add_a_photo,
            color: Colors.grey,
          ))
        ],
      );
    } else {
      // Show user's profile picture
      return Stack(
        children: [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            radius: 50,
            backgroundImage: NetworkImage(_profileImageUrl!),
          ),
          Container(
              child: Icon(
            Icons.add_a_photo,
            color: Colors.grey,
          ))
        ],
      );
    }
  }

  Future<void> _pickAndUploadImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;

    final imageFile = File(pickedImage.path!);
    final storageReference = FirebaseStorage.instance
        .ref()
        .child('profile_images')
        .child('$_userID.jpg'); // Use the userID as part of the image name

    await storageReference.putFile(imageFile);
    final imageUrl = await storageReference.getDownloadURL();

    // Save the profile picture URL to Firestore based on user ID
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_userID)
          .set({'profileImageUrl': imageUrl});
    } catch (e) {
      print("Error uploading profile picture: $e");
    }

    setState(() {
      _profileImageUrl = imageUrl;
    });
  }
}
