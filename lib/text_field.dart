import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String hintText;
  Icon icon;
  TextEditingController controller;

  MyTextField(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.controller,});
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.white),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: icon,
          hintText: hintText,
          hintStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),

        validator: (String? value){
          return (value == null || value.isEmpty)? "Sorry ,this is unexpected data!" : null;
        },





      ),
    );
  }


}
