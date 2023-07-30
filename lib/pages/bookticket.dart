import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:railway/pages/updatepage.dart';

import 'Book.dart';

class Btickets extends StatefulWidget {
  Btickets({super.key});

  @override
  State<Btickets> createState() => _BticketsState();
}

class _BticketsState extends State<Btickets> {
  // Function to fetch data from Firestore
  Future<List<Map<String, dynamic>>> fetchDataFromFirestore() async {
    List<Map<String, dynamic>> dataList = [];

    // Replace 'your_collection_name' with the actual name of your collection in Firestore
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('bookdata').get();

    // Loop through the documents and store the data in a list of maps
    snapshot.docs.forEach((document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      // Add the document ID along with the data to the list
      data['documentId'] = document.id;
      dataList.add({...data, 'documentId': document.id});
    });

    return dataList;
  }

  void deleteDataFromFirestore(String documentId) async {
    try {
      // Replace 'your_collection_name' with the actual name of your collection in Firestore
      await FirebaseFirestore.instance
          .collection('bookdata')
          .doc(documentId)
          .delete();
      print('Document with ID: $documentId deleted successfully.');
    } catch (e) {
      print('Error deleting document with ID: $documentId. Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchDataFromFirestore(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Center(child: CircularProgressIndicator()));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Map<String, dynamic>> dataList = snapshot.data!;
              if (dataList.isEmpty) {
                // Show a message when there are no tickets available
                return Center(child: Text('No Tickets Available'));
              }

              return ListView.separated(
                itemCount: dataList.length,
                separatorBuilder: (context, index) => Divider(
                  // Custom separator between items
                  color: const Color.fromARGB(255, 232, 8, 8),
                  height: 10,
                ),
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = dataList[index];
                  // final ticketData = data[index].data() as Map<String, dynamic>;
                  // final ticketId = data[index].id;
                  String documentId = data['documentId']; // Get the document ID

                  return Dismissible(
                    key: Key(documentId),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) async {
                      try {
                        deleteDataFromFirestore(
                            documentId); // Use the document ID for deletion
                        setState(() {
                          dataList.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Item deleted'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Error deleting item. Please try again.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: Container(
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data["tname"],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "₹ " + data["price"].toString(),
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
                                    data['placeFrom'],
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Image(
                                    image:
                                        AssetImage("lib/images/two-arrows.png"),
                                    color: Color.fromARGB(255, 73, 61, 26),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      // softWrap: false,
                                      // overflow: TextOverflow.fade,
                                      data['placeTo'],
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                child: Row(
                                  children: [
                                    Text(
                                      data["timestart"],
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    const Image(
                                      image:
                                          AssetImage("lib/images/delete.png"),
                                      width: 15,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      data["timeend"],
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                data["date"],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Visibility(
                                    visible: true,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          Update_tic(ticketData: data),
                                          transition: Transition.fade,
                                          duration: Duration(seconds: 1),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        child: const Text(
                                          "update",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: true,
                                    child: GestureDetector(
                                      onTap: () {
                                        print(documentId);
                                        // This gesture detects when the "Cancel" button is tapped
                                        deleteDataFromFirestore(
                                            documentId); // Delete the data from Firestore
                                        setState(() {
                                          dataList.removeAt(
                                              index); // Remove the item from the local list
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 125, 124, 124),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        child: const Text(
                                          "Cancle",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
