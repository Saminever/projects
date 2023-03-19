// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bing_1/mane_page.dart';
// import 'package:flutter_bing_1/read_data.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class update_data extends StatefulWidget {
//   const update_data({super.key});

//   @override
//   State<update_data> createState() => _update_dataState();
// }

// class _update_dataState extends State<update_data> {
//   final NameController = new TextEditingController();
//   final FathernameController = new TextEditingController();
//   final contactController = new TextEditingController();
//   final AddressController = new TextEditingController();
//   final ageController = new TextEditingController();
//   final _formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 221, 217, 214),
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           color: Colors.black,
//           onPressed: (() {
//             Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => manepage()));
//           }),
//         ),
//         title: Text('School_'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 250,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   border: Border.all(width: 2),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(25),
//                     bottomRight: Radius.circular(
//                       25,
//                     ),
//                   ),
//                   image: DecorationImage(
//                       image: AssetImage('assets/y2.png'), fit: BoxFit.cover),
//                   boxShadow: [
//                     BoxShadow(
//                         blurRadius: 12,
//                         offset: Offset(2, 9),
//                         color: Color.fromARGB(255, 172, 168, 138))
//                   ]),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Form(
//               key: _formkey,
//               child: Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(top: 20, left: 20),
//                     height: 60,
//                     width: 300,
//                     decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                               blurRadius: 12,
//                               offset: Offset(2, 9),
//                               color: Color.fromARGB(255, 85, 85, 84))
//                         ],
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(25)),
//                     child: TextFormField(
//                         controller: NameController,
//                         keyboardType: TextInputType.name,
//                         validator: (value) {
//                           RegExp regex = new RegExp(r'^.{2,}$');
//                           if (value!.isEmpty) {
//                             return ("First Name cannot be Empty");
//                           }
//                           if (!regex.hasMatch(value)) {
//                             return ("Enter Valid name(Min. 2 Character)");
//                           }
//                           return null;
//                         },
//                         onSaved: (value) {
//                           NameController.text = value!;
//                         },
//                         textInputAction: TextInputAction.next,
//                         decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.account_circle),
//                             hintText: "Name",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(56),
//                             ))),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 20, left: 20),
//                     height: 60,
//                     width: 300,
//                     decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                               blurRadius: 12,
//                               offset: Offset(2, 9),
//                               color: Color.fromARGB(255, 85, 85, 84))
//                         ],
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(25)),
//                     child: TextFormField(
//                         controller: FathernameController,
//                         keyboardType: TextInputType.name,
//                         validator: (value) {
//                           RegExp regex = new RegExp(r'^.{2,}$');
//                           if (value!.isEmpty) {
//                             return ("First Name cannot be Empty");
//                           }
//                           if (!regex.hasMatch(value)) {
//                             return ("Enter Valid name(Min. 2 Character)");
//                           }
//                           return null;
//                         },
//                         onSaved: (value) {
//                           NameController.text = value!;
//                         },
//                         textInputAction: TextInputAction.next,
//                         decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.account_circle),
//                             hintText: "Father Name",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(56),
//                             ))),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 20, left: 20),
//                     height: 60,
//                     width: 300,
//                     decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                               blurRadius: 12,
//                               offset: Offset(2, 9),
//                               color: Color.fromARGB(255, 85, 85, 84))
//                         ],
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(25)),
//                     child: TextFormField(
//                         controller: contactController,
//                         keyboardType: TextInputType.name,
//                         validator: (value) {
//                           RegExp regex = new RegExp(r'^.{2,}$');
//                           if (value!.isEmpty) {
//                             return ("First Name cannot be Empty");
//                           }
//                           if (!regex.hasMatch(value)) {
//                             return ("Enter Valid name(Min. 2 Character)");
//                           }
//                           return null;
//                         },
//                         onSaved: (value) {
//                           contactController.text = value!;
//                         },
//                         textInputAction: TextInputAction.next,
//                         decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.account_circle),
//                             hintText: "Contact",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(56),
//                             ))),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 20, left: 20),
//                     height: 60,
//                     width: 300,
//                     decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                               blurRadius: 12,
//                               offset: Offset(2, 9),
//                               color: Color.fromARGB(255, 85, 85, 84))
//                         ],
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(25)),
//                     child: TextFormField(
//                         controller: AddressController,
//                         keyboardType: TextInputType.name,
//                         validator: (value) {
//                           RegExp regex = new RegExp(r'^.{2,}$');
//                           if (value!.isEmpty) {
//                             return ("First Name cannot be Empty");
//                           }
//                           if (!regex.hasMatch(value)) {
//                             return ("Enter Valid name(Min. 2 Character)");
//                           }
//                           return null;
//                         },
//                         onSaved: (value) {
//                           AddressController.text = value!;
//                         },
//                         textInputAction: TextInputAction.next,
//                         decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.account_circle),
//                             hintText: "Addres",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(56),
//                             ))),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 20, left: 20),
//                     height: 60,
//                     width: 300,
//                     decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                               blurRadius: 12,
//                               offset: Offset(2, 9),
//                               color: Color.fromARGB(255, 85, 85, 84))
//                         ],
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(25)),
//                     child: TextFormField(
//                         controller: ageController,
//                         keyboardType: TextInputType.name,
//                         validator: (value) {
//                           RegExp regex = new RegExp(r'^.{2,}$');
//                           if (value!.isEmpty) {
//                             return ("First Name cannot be Empty");
//                           }
//                           if (!regex.hasMatch(value)) {
//                             return ("Enter Valid name(Min. 2 Character)");
//                           }
//                           return null;
//                         },
//                         onSaved: (value) {
//                           ageController.text = value!;
//                         },
//                         textInputAction: TextInputAction.next,
//                         decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.account_circle),
//                             hintText: "Age",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(56),
//                             ))),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   ElevatedButton(
//                     child: Text(
//                       '      Submit     ',
//                       style:
//                           TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                         primary: Color.fromARGB(255, 224, 203, 45)),
//                     onPressed: () {
//                       Fluttertoast.showToast(msg: "Submit Form Sccessful");

//                       if (_formkey.currentState!.validate()) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => reda_data()),
//                         );
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
