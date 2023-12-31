import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'componments/liste.dart';

class Result_page extends StatefulWidget {
  const Result_page({super.key});

  @override
  State<Result_page> createState() => _Result_pageState();
}

class _Result_pageState extends State<Result_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Listcard();
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: 6)),
    );
  }
}
