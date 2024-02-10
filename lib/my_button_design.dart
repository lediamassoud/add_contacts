import 'package:flutter/material.dart';

class MyButtonDesign extends StatelessWidget {
  String buttonText;
  Function onClick;
  MaterialStateProperty<Color> buttonColor;

  MyButtonDesign(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          onPressed: () {
            onClick();
          },
          style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
              backgroundColor: buttonColor,
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              )),
          child: Text(
            buttonText,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          )),
    );
  }
}
