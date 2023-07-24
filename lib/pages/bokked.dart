import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';

import 'package:flutter/src/widgets/framework.dart';

class BokkedTickets extends StatelessWidget {
  const BokkedTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: FlutterTicketWidget(
                width: 350.0,
                height: 500.0,
                isCornerRounded: true,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 120.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border:
                                  Border.all(width: 1.0, color: Colors.green),
                            ),
                            child: Center(
                              child: Text(
                                'Business Class',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'DEL',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.train,
                                  color: Colors.pink,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'MUM',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Train Ticket',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Column(
                          children: <Widget>[
                            ticketDetailsWidget(
                                'Passengers', 'Ilona', 'Date', '24-12-2023'),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, right: 40.0),
                              child: ticketDetailsWidget(
                                  'Train', 'Rajdhani', 'Gate', '3'),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, right: 40.0),
                              child: ticketDetailsWidget(
                                  'Class', 'Business', 'Seat', '21B'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 80.0, left: 30.0, right: 30.0),
                        child: Container(
                          width: 250.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('lib/images/barcode.png'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 75.0, right: 75.0),
                        child: Text(
                          '9824 0972 1742 1298',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  firstDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                secondTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  secondDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
