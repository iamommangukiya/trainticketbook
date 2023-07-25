import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/Loginpage.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Loginpage(),
    );
  }
}
