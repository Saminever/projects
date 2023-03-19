import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bing_1/animation/animation.dart';
import 'package:flutter_bing_1/mane_page.dart';
import 'package:flutter_bing_1/widget.dart/teacher_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class form_desing extends StatefulWidget {
  const form_desing({super.key});

  @override
  State<form_desing> createState() => _form_desingState();
}

class _form_desingState extends State<form_desing> {
  final namecontroller = TextEditingController();
  final subjectcontroller = TextEditingController();
  final contactcontroller = TextEditingController();
  final classcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 320,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: -10,
                        width: width + 20,
                        height: 300,
                        child: Container(
                          width: width + 20,
                          height: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/background.png"),
                            fit: BoxFit.fill,
                          )),
                        )),
                    Positioned(
                      width: width + 20,
                      height: 350,
                      child: Container(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 190, right: 300),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => manepage()));
                            },
                            icon: Icon(Icons.arrow_back),
                            iconSize: 30,
                          ),
                        ),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/background2.png"),
                          fit: BoxFit.fill,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: Text(
                        'Teacher Data',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 170, 20, 170),
                            fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(196, 135, 198, 4),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ]),
                      child: Column(children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          Color.fromARGB(255, 227, 218, 218)))),
                          child: TextFormField(
                            cursorColor: Colors.purpleAccent,
                            keyboardType: TextInputType.name,
                            controller: namecontroller,
                            validator: (value) {
                              RegExp regex = new RegExp(r'^.{2,}$');
                              if (value!.isEmpty) {
                                return ("First Name cannot be Empty");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid name(Min. 2 Character)");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              namecontroller.text = value!;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: '   teacher name',
                                labelStyle:
                                    TextStyle(color: Colors.purpleAccent),
                                hintText: '     teacher name',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 13, 13, 13))),
                          ),
                        ),

                        /////////
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            cursorColor: Colors.purpleAccent,
                            keyboardType: TextInputType.name,
                            controller: subjectcontroller,
                            validator: (value) {
                              RegExp regex = new RegExp(r'^.{2,}$');
                              if (value!.isEmpty) {
                                return ("First Name cannot be Empty");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid name(Min. 2 Character)");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              subjectcontroller.text = value!;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: ' subject',
                                labelStyle:
                                    TextStyle(color: Colors.purpleAccent),
                                hintText: ' Subject',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 10, 9, 10))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            cursorColor: Colors.purpleAccent,
                            keyboardType: TextInputType.name,
                            controller: classcontroller,
                            validator: (value) {
                              RegExp regex = new RegExp(r'^.{2,}$');
                              if (value!.isEmpty) {
                                return ("First Name cannot be Empty");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid name(Min. 2 Character)");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              classcontroller.text = value!;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'class',
                                labelStyle:
                                    TextStyle(color: Colors.purpleAccent),
                                hintText: '     class',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            cursorColor: Colors.purpleAccent,
                            keyboardType: TextInputType.name,
                            controller: contactcontroller,
                            validator: (value) {
                              RegExp regex = new RegExp(r'^.{2,}$');
                              if (value!.isEmpty) {
                                return ("First Name cannot be Empty");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid name(Min. 2 Character)");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              contactcontroller.text = value!;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'contact',
                                labelStyle:
                                    TextStyle(color: Colors.purpleAccent),
                                hintText: '  Contact   ',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                width: 10,
              ),
              Center(
                child: SizedBox(
                  width: 300.0,
                  height: 45,
                  child: OutlinedButton(
                    child: Text(
                      'teacher data ',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 143, 31, 191),
                      elevation: 5,
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => view_teacher()),
                        );

                        Fluttertoast.showToast(msg: "Submit Form Sccessful");
                        FirebaseFirestore.instance
                            .collection("teacher_data")
                            .add({
                          'teacher_name': '${namecontroller.text}',
                          'subject': '${subjectcontroller.text}',
                          'contact': '${contactcontroller.text}',
                          'class': '${classcontroller.text}',
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
