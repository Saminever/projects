// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bing_1/widget.dart/teacher_view.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class teacher_data extends StatefulWidget {
//   const teacher_data({super.key});

//   @override
//   State<teacher_data> createState() => _teacher_dataState();
// }

// class _teacher_dataState extends State<teacher_data> {
//   final namecontorller = TextEditingController();
//   final subjectcontorller = TextEditingController();
//   final contactcontorller = TextEditingController();
//   final classcontorller = TextEditingController();
//   final _formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         centerTitle: true,
//         title: Text(
//           "teacher data",
//           style: TextStyle(
//               fontSize: 30, color: Color.fromARGB(255, 204, 200, 200)),
//         ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formkey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Center(
//                       child: Text(
//                     "teacher_data",
//                     style: TextStyle(fontSize: 20),
//                   )),
//                 ),
//                 Center(
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.only(top: 40, left: 20, right: 10),
//                     child: TextFormField(
//                       controller: namecontorller,
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (value) {
//                         RegExp regex = new RegExp(r'^.{2,}$');
//                         if (value!.isEmpty) {
//                           return ("First Name cannot be Empty");
//                         }
//                         if (!regex.hasMatch(value)) {
//                           return ("Enter Valid name(Min. 2 Character)");
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         namecontorller.text = value!;
//                       },
//                       textInputAction: TextInputAction.next,
//                       decoration: InputDecoration(
//                         hintText: "Teacher Name",
//                         prefixIcon: Icon(Icons.face),
//                         prefixIconColor: Colors.grey,
//                         filled: true,
//                         fillColor: Color.fromARGB(255, 208, 187, 187),
//                         contentPadding: const EdgeInsets.only(
//                             left: 14.0, bottom: 6.0, top: 8.0),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.red),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         enabledBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20, right: 10),
//                   child: TextFormField(
//                     controller: subjectcontorller,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       RegExp regex = new RegExp(r'^.{2,}$');
//                       if (value!.isEmpty) {
//                         return (" subject cannot be Empty");
//                       }
//                       if (!regex.hasMatch(value)) {
//                         return ("Enter Valid name(Min. 4 Character)");
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       subjectcontorller.text = value!;
//                     },
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.book),
//                       hintText: "subject",
//                       filled: true,
//                       fillColor: Color.fromARGB(255, 208, 187, 187),
//                       contentPadding: const EdgeInsets.only(
//                           left: 14.0, bottom: 6.0, top: 8.0),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20, right: 10),
//                   child: TextFormField(
//                     controller: contactcontorller,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       RegExp regex = new RegExp(r'^.{2,}$');
//                       if (value!.isEmpty) {
//                         return (" contact cannot be Empty");
//                       }
//                       if (!regex.hasMatch(value)) {
//                         return ("Enter Valid name(Min. 11 Character)");
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       namecontorller.text = value!;
//                     },
//                     decoration: InputDecoration(
//                       hintText: "contact",
//                       filled: true,
//                       fillColor: Color.fromARGB(255, 208, 187, 187),
//                       contentPadding: const EdgeInsets.only(
//                           left: 14.0, bottom: 6.0, top: 8.0),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20, right: 10),
//                   child: TextFormField(
//                     controller: classcontorller,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       RegExp regex = new RegExp(r'^.{2,}$');
//                       if (value!.isEmpty) {
//                         return ("class cannot be Empty");
//                       }
//                       if (!regex.hasMatch(value)) {
//                         return ("Enter Valid name(Min. 2 Character)");
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       namecontorller.text = value!;
//                     },
//                     decoration: InputDecoration(
//                       hintText: "class",
//                       filled: true,
//                       fillColor: Color.fromARGB(255, 208, 187, 187),
//                       contentPadding: const EdgeInsets.only(
//                           left: 14.0, bottom: 6.0, top: 8.0),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 25),
//                   child: IconButton(
//                     iconSize: 70,
//                     icon: const Icon(
//                       Icons.login,
//                     ),
//                     onPressed: () {
//                       setState(
//                         () {
//                           if (_formkey.currentState!.validate()) {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => view_teacher()),
//                             );

//                             Fluttertoast.showToast(
//                                 msg: "Submit Form Sccessful");
//                             FirebaseFirestore.instance
//                                 .collection("teacher_data")
//                                 .add({
//                               'teacher_name': '${namecontorller.text}',
//                               'subject': '${subjectcontorller.text}',
//                               'contact': '${contactcontorller.text}',
//                               'class': '${classcontorller.text}',
//                             });
//                           }
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
