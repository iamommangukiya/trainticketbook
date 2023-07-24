import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Tfield extends StatelessWidget {
  final String hintext;
  final controller;
  final bool obssecuretext;
  const Tfield(
      {super.key,
      required this.hintext,
      this.controller,
      required this.obssecuretext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obssecuretext,
        decoration: InputDecoration(
            hintText: hintext,
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade400)),
            fillColor: Colors.grey.shade200,
            hintStyle: TextStyle(color: Colors.grey[500]),
            filled: true),
      ),
    );
  }
}
