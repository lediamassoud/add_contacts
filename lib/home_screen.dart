import 'package:flutter/material.dart';
import 'package:untitled/text_field.dart';

import 'my_button_design.dart';
import 'one_contact.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController(text: "");
  TextEditingController phone = TextEditingController(text: "");
  bool emptyName = false;
  bool emptyPhone = false;
  bool addButton = true;
  bool deleteButton = false;
  List<Widget> contacts = [];

  int indexCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9d9d9d),
      appBar: AppBar(
        title: const Text("Contacts Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            children: [
              MyTextField(
                controller: name,
                hintText: "Enter Your Name Here",
                icon: const Icon(
                  Icons.create,
                  color: Colors.blue,
                ),
              ),

              MyTextField(
                  controller: phone,
                  hintText: "Enter Your Number Here",
                  icon: const Icon(Icons.call, color: Colors.blue)),


              const SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Visibility(
                      visible: contacts.length == 3 ? false : true,
                      child: MyButtonDesign(
                        buttonText: "Add",
                        buttonColor: MaterialStateProperty.all(Colors.blue),
                        onClick: onAddClick,
                      ),
                    ),

                  ],
                ),
              ),
              Column(
                children: [
                  for (int i = 0; i < contacts.length; i++) contacts[i],
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //List <int> allIndexes = [];
  void onAddClick() {
    final isValidForm = formKey.currentState!.validate();
    setState(() {

      if(isValidForm){
        contacts.add(OneContact(name: name.text, phone: phone.text, index: contacts.length ,onDeleteClick: onDeleteClick,));
       // allIndexes.add(contacts.length);
        // print("----------------------------------------$allIndexes");
      }

      if (contacts.length >= 3) {
        addButton = false;
      } else {
        addButton = true;
      }
      clearText();
    });
  }

  void onDeleteClick(int i) {
    setState(() {
      contacts.removeAt(i);
      //updateIndex(i);
    });
  }
  // void updateIndex(int i){
  //   print("----------------------------------------$allIndexes");
  //   for (int j = i ; j < allIndexes.length ; j++){
  //     allIndexes[j]--;
  //     print("----------------------------------------$allIndexes");
  //   }
  // }
  void clearText() {
    phone.clear();
    name.clear();
  }
  // int indexRow(){
  //   return indexCounter ++ ;
  // }
}
