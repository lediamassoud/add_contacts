import 'package:flutter/material.dart';

class OneContact extends StatefulWidget {
  late String name;
  late String phone;
  int index;
  Function onDeleteClick;
  OneContact({super.key, required this.name, required this.phone, required this.index, required this.onDeleteClick});

  @override
  State<OneContact> createState() => _OneContactState();
}

class _OneContactState extends State<OneContact> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Name: ${widget.name}"),
                Text("Phone: ${widget.phone}"),
              ],
            ),
             TextButton(
               style: const ButtonStyle(
                 backgroundColor: MaterialStatePropertyAll(Colors.white),
               ),
               onPressed: (){
                 widget.onDeleteClick(widget.index);
               },
               child: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 30,
            ),
             ),
          ],
        ),
      ),
    );
  }



}
