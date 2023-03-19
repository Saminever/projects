import 'package:flutter/material.dart';
import 'package:flutter_bing_1/homescreen.dart';
import 'package:flutter_bing_1/read_data.dart';
import 'package:flutter_bing_1/widget.dart/form_desing.dart';
import 'package:flutter_bing_1/widget.dart/teacher_data.dart';
import 'package:flutter_bing_1/widget.dart/teacher_view.dart';

class start extends StatefulWidget {
  const start({super.key});

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Inter data",
          style: TextStyle(
              fontSize: 30, color: Color.fromARGB(255, 255, 253, 253)),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 200,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 60),
                child: Text(
                  ' Home Page',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 40),
                ),
              ),
              color: Color.fromARGB(255, 255, 250, 250),
            ),
          ),
          Center(
            child: SizedBox(
              width: 200.0,
              height: 50,
              child: OutlinedButton(
                child: Text(
                  ' Add Student ',
                  style: TextStyle(color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 3, 3),
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homescreen()),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: SizedBox(
              width: 200.0,
              height: 50,
              child: OutlinedButton(
                child: Text(
                  ' View Student ',
                  style: TextStyle(color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 3, 3),
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => reda_data()),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: SizedBox(
              width: 200.0,
              height: 50,
              child: OutlinedButton(
                child: Text(
                  ' add teacher ',
                  style: TextStyle(color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 3, 3),
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => form_desing()),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: SizedBox(
              width: 200.0,
              height: 50,
              child: OutlinedButton(
                child: Text(
                  ' View Teacher ',
                  style: TextStyle(color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 3, 3),
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => view_teacher()),
                  );
                },
              ),
            ),
          ),
          // Center(
          //   child: TextButton(
          //     style: TextButton.styleFrom(
          //       primary: Colors.blue,
          //     ),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => teacher_data()),
          //       );
          //     },
          //     child: Text('add teacher'),
          //   ),
          // )

          // IconButton(onPressed: (){}, icon:())
        ],
      ),

      // body: SafeArea(
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(left: 50, top: 30),
      //         child: Text(
      //           'Home Page',
      //           style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //       Center(
      //         child: SizedBox(
      //           width: 200.0,
      //           height: 50,
      //           child: OutlinedButton(
      //             child: Text(' Add Student '),
      //             style: OutlinedButton.styleFrom(
      //               backgroundColor: Color.fromARGB(255, 255, 3, 3),
      //               elevation: 5,
      //             ),
      //             onPressed: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => homescreen()),
      //               );
      //             },
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 50,
      //       ),
      //       SizedBox(
      //         width: 200.0,
      //         height: 50,
      //         child: OutlinedButton(
      //           child: Text('View Student'),
      //           style: OutlinedButton.styleFrom(
      //             backgroundColor: Color.fromARGB(255, 255, 3, 3),
      //             elevation: 5,
      //           ),
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => reda_data()),
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_bing_1/splashscreen.dart';
// import 'package:flutter_bing_1/widget.dart/widget.dart';

// class Desing extends StatefulWidget {
//   const Desing({super.key});

//   @override
//   State<Desing> createState() => _DesingState();
// }

// class _DesingState extends State<Desing> {
//   final NameController = new TextEditingController();
//   final _formkey = GlobalKey<FormState>();
//   double _headerHeight = 250;

//   @override
//   Widget build(BuildContext context) {
 //   return Scaffold(
//       backgroundColor: Colors.white,

//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: _headerHeight,
//               child: HeaderWidget(_headerHeight, true,
//                   Icons.login_rounded), //let's create a common header widget
//            ),
//             SafeArea(
//               child: Container(
//                   padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//                   margin: EdgeInsets.fromLTRB(
//                       20, 10, 20, 10), // This will be the login form
//                   child: Column(
//                     children: [
//                       Text(
//                         'Hello',
//                         style: TextStyle(
//                             fontSize: 60, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         'Signin into your account',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       SizedBox(height: 30.0),
//                       Form(
//                           key: _formkey,
//                           child: Column(
//                             children: [
//                               Container(
//                                 child: TextFormField(
//                                     autofocus: false,
//                                     controller: NameController,
//                                     keyboardType: TextInputType.emailAddress,
//                                     validator: (value) {
//                                       RegExp regex = new RegExp(r'^.{3,}$');
//                                       if (value!.isEmpty) {
//                                         return ("First Name cannot be Empty");
//                                       }
//                                       if (!regex.hasMatch(value)) {
//                                         return ("Enter Valid name(Min. 3 Character)");
//                                       }
//                                       return null;
//                                     },
//                                     onSaved: (value) {
//                                       NameController.text = value!;
//                                     },
//                                     textInputAction: TextInputAction.next,
//                                     decoration: InputDecoration(
//                                         prefixIcon: Icon(Icons.account_circle),
//                                         contentPadding:
//                                             EdgeInsets.fromLTRB(20, 15, 20, 15),
//                                         hintText: "Name",
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                         ))),
//                               ),
//                               SizedBox(height: 30.0),
//                               Container(
//                                 child: TextFormField(
//                                     autofocus: false,
//                                     controller: NameController,
//                                     keyboardType: TextInputType.emailAddress,
//                                     validator: (value) {
//                                       RegExp regex = new RegExp(r'^.{3,}$');
//                                       if (value!.isEmpty) {
//                                         return ("First Name cannot be Empty");
//                                       }
//                                       if (!regex.hasMatch(value)) {
//                                         return ("Enter Valid name(Min. 3 Character)");
//                                       }
//                                       return null;
//                                     },
//                                     onSaved: (value) {
//                                       NameController.text = value!;
//                                     },
//                                     textInputAction: TextInputAction.next,
//                                     decoration: InputDecoration(
//                                         prefixIcon: Icon(Icons.account_circle),
//                                         contentPadding:
//                                             EdgeInsets.fromLTRB(20, 15, 20, 15),
//                                         hintText: "Name",
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                         ))),
//                               ),
//                               SizedBox(height: 15.0),
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
//                                 alignment: Alignment.topRight,
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => splashscreen()),
//                                     );
//                                   },
//                                   child: Text(
//                                     "Forgot your password?",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )),
//                     ],
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
