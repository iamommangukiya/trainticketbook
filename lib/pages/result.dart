import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../componments/liste.dart';

class Trip {
  final String fromcity;
  final String tocity;
  final String price;
  final String time;

  Trip(
      {required this.fromcity,
      required this.price,
      required this.time,
      required this.tocity});
}

Stream<List<Trip>> getTripsStream() {
  return FirebaseFirestore.instance.collection('tdata').snapshots().map(
      (snapshot) => snapshot.docs
          .map((doc) => Trip(
              fromcity: doc['placeFrom'],
              tocity: doc['placeTo'],
              price: doc['price'],
              time: doc['name']))
          .toList());
}

class Result_page extends StatefulWidget {
  Result_page({super.key});

  @override
  State<Result_page> createState() => _Result_pageState();
}

class _Result_pageState extends State<Result_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<List<Trip>>(
          stream: getTripsStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            List<Trip>? trips = snapshot.data;
            if (trips == null || trips.isEmpty) {
              return Center(child: Text('No trips found'));
            }

            return ListView.separated(
              itemCount: trips.length,
              itemBuilder: (context, index) {
                Trip trip = trips[index];
                // String formattedTime = DateFormat('yyyy-MM-dd HH:mm').format(trip.time);

                return ListTile(
                  hoverColor: Colors.black26,
                  selectedColor: Colors.black,
                  tileColor: const Color.fromARGB(255, 255, 242, 204),
                  title: Text(trip.fromcity + "-" + trip.tocity),
                  subtitle: Text('Price: \$${trip.price}\nTime:' + trip.time),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            );
          },
        ),
      ),
    );
  }
}

//  return Listcard();
