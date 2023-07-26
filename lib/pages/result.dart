import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:railway/pages/crrditcard.dart';

import '../componments/liste.dart';

class Trip {
  final String fromcity;
  final String tocity;
  final String price;
  final String date;
  final String endtime;
  final String starttime;

  Trip(
      {required this.date,
      required this.endtime,
      required this.starttime,
      required this.fromcity,
      required this.price,
      required this.tocity,
      required});
}

Stream<List<Trip>> getTripsStream(String fromCity, String toCity) {
  String fromCityLower =
      fromCity[0].toUpperCase() + fromCity.substring(1).toLowerCase();
  String toCityLower =
      toCity[0].toUpperCase() + toCity.substring(1).toLowerCase();

  print(fromCityLower);
  print(toCityLower);
  return FirebaseFirestore.instance
      .collection('newtdata')
      .where('placeFrom', isEqualTo: fromCityLower)
      .where('placeTo', isEqualTo: toCityLower)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Trip(
                date: doc['date'],
                endtime: doc['timeend'],
                starttime: doc['timestart'],
                fromcity: doc['placeFrom'],
                tocity: doc['placeTo'],
                price: doc['price'],
              ))
          .toList());
}

class Result_page extends StatelessWidget {
  final String intoCity;

  final String inFromcity;
  const Result_page(
      {super.key, required this.intoCity, required this.inFromcity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<List<Trip>>(
          stream: getTripsStream(inFromcity, intoCity),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            List<Trip>? trips = snapshot.data;
            if (trips == null || trips.isEmpty) {
              return Center(child: Text('No Ticket founded found'));
            }

            return ListView.separated(
              itemCount: trips.length,
              itemBuilder: (context, index) {
                Trip trip = trips[index];
                // String formattedTime = DateFormat('yyyy-MM-dd HH:mm').format(trip.time);

                return GestureDetector(
                  onTap: () {
                    Get.to(Credit_card_page(trip: trip));
                  },
                  child: Listcard(
                    placefrom: trip.fromcity,
                    placeto: trip.tocity,
                    timestart: trip.starttime,
                    timeend: trip.endtime,
                    traname: "Railway",
                    price: trip.price,
                  ),
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
