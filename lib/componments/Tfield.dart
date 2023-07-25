import 'package:flutter/material.dart';

class Tfield extends StatelessWidget {
  final String hintext;
  final String valistring;
  final controller;
  final bool obssecuretext;

  const Tfield(
      {super.key,
      required this.hintext,
      required this.valistring,
      this.controller,
      required this.obssecuretext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        validator: (value) {
          if (value!.length < 0) {
            return valistring;
          }
        },
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
