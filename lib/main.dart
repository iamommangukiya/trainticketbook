import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'Login _page.dart';

void main() => {runApp(Myapp())};

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      home: Loginpage(),
      // initialRoute: Routerclass.gethomepageroute(),
    );
  }
}
