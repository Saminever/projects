import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bing_1/loginscreen.dart';
import 'package:flutter_bing_1/mane_page.dart';
import 'package:flutter_bing_1/model/data_controller.dart';
import 'package:flutter_bing_1/model/user_model.dart';
import 'package:flutter_bing_1/read_data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final NameController = new TextEditingController();
  final FathernameController = new TextEditingController();
  final contactController = new TextEditingController();
  final AddressController = new TextEditingController();
  final ageController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final NameField = TextFormField(
        controller: NameController,
        keyboardType: TextInputType.name,
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
          NameController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

    final fathername = TextFormField(
        controller: FathernameController,
        keyboardType: TextInputType.name,
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
          FathernameController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Father Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));
    final Contact = TextFormField(
        controller: contactController,
        keyboardType: TextInputType.number,
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
          contactController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.contact_phone_sharp),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Contact Number",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));
    final Addres = TextFormField(
        controller: AddressController,
        keyboardType: TextInputType.streetAddress,
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
          AddressController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.location_city),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Street Address",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

    final ageField = TextFormField(
        keyboardType: TextInputType.number,
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
          ageController.text = value!;
        },
        controller: ageController,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.contact_phone_sharp),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "age con",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));
    final loginButton = Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 235, 8, 8),
        child: MaterialButton(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              Fluttertoast.showToast(msg: "Submit Form Sccessful");

              if (_formkey.currentState!.validate()) {
                FirebaseFirestore.instance.collection('userdata').add({
                  'u_name': '${NameController.text}',
                  'Age': '${ageController.text}',
                  'email': '${loggedInUser.email}',
                  'father_name': '${FathernameController.text}',
                  'contact': '${contactController.text}',
                  'Addres': '${AddressController.text}',
                  'name':
                      "${loggedInUser.firstName} ${loggedInUser.secondName}",
                  // 'date': DateTime.now(),
                });
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => reda_data()),
              );
              }
             
            },
            child: Text(
              "Submit Form",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            )));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.yellow,
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => manepage()));
          },
        ),
        title: Text(" USER DATA "),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 45),
                    NameField,
                    SizedBox(height: 20),
                    fathername,
                    SizedBox(
                      height: 20,
                    ),
                    Contact,
                    SizedBox(
                      height: 20,
                    ),
                    Addres,
                    SizedBox(height: 20),
                    ageField,
                    SizedBox(height: 20),
                    loginButton,

                    // SizedBox(height: 20),
                    // confirmPasswordField,
                    // SizedBox(height: 20),
                    // signUpButton,
                    // SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

  // User? user = FirebaseAuth.instance.currentUser;

  // UserModel loggedInUser = UserModel();

  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     this.loggedInUser = UserModel.fromMap(value.data());
  //     setState(() {});
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       backgroundColor: Color.fromARGB(255, 213, 190, 188),
  //       drawer: Drawer(
  //         backgroundColor: Color.fromARGB(255, 209, 38, 38),
  //         child: ListView(
  //           padding: EdgeInsets.zero,
  //           children: <Widget>[
  //             DrawerHeader(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.max,
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: <Widget>[
  //                   Padding(
  //                     padding: const EdgeInsets.only(bottom: 1),
  //                     child: Column(
  //                       children: [
  //                         Text(
  //                           "${loggedInUser.firstName} ${loggedInUser.secondName}",
  //                           style: TextStyle(
  //                             fontSize: 20,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                         Text(
  //                           "${loggedInUser.email}",
  //                           style: TextStyle(
  //                             fontSize: 20,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               decoration: BoxDecoration(
  //                 color: Color.fromARGB(255, 8, 214, 32),
  //                 image: DecorationImage(
  //                   image: AssetImage('assets/back.jpg'),
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //             ListTile(
  //               leading: Icon(Icons.logout_outlined),
  //               iconColor: Colors.black,
  //               onTap: () {
  //                 Navigator.push(context,
  //                     MaterialPageRoute(builder: (context) => loginscreen()));
  //               },
  //               trailing: Padding(
  //                 padding: const EdgeInsets.only(right: 190),
  //                 child: Text('Logout'),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       bottomNavigationBar: GNav(
  //           gap: 1,
  //           backgroundColor: Color.fromRGBO(250, 78, 5, 1),
  //           color: Colors.white,
  //           tabBackgroundColor: Color.fromARGB(255, 179, 164, 162),
  //           tabs: const [
  //             GButton(
  //               icon: Icons.home,
  //               text: 'home',
  //             ),
  //             GButton(
  //               icon: Icons.favorite,
  //               text: 'like',
  //             ),
  //             GButton(
  //               icon: Icons.search_sharp,
  //               text: 'search',
  //             ),
  //             GButton(
  //               icon: Icons.settings,
  //               text: 'setting',
  //             ),
  //           ]),
  //       appBar: AppBar(
  //         title: Text("SAMMI"),
  //         backgroundColor: Color.fromARGB(255, 243, 96, 33),
  //       ),
  //       body: TextButton(
  //         style: ButtonStyle(),
  //         onPressed: () {
  //           FirebaseFirestore.instance.collection("Book").add({
  //             "chapter id ": "1",
  //             "chapter Name ": "ABC",
  //           });
  //         },
  //         child: Text('Insert Data'),
  //       )

  //// GridView(
  //     gridDelegate:
  //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  //     children: [
  //       Container(
  //         margin: EdgeInsets.only(top: 10),
  //         color: Colors.white,
  //         height: 250,
  //         width: 100,
  //         child: Column(
  //           children: [
  //             Container(
  //               margin: EdgeInsets.only(top: 10),
  //               height: 130,
  //               width: 150,
  //               decoration: BoxDecoration(
  //                 image: DecorationImage(
  //                   image: AssetImage('assets/food1.jpg'),
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               margin: EdgeInsets.only(top: 2),
  //               height: 20,
  //               width: 150,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(left: 13),
  //                 child: Row(
  //                   children: [
  //                     Text(
  //                       'food collection ',
  //                       style: TextStyle(fontWeight: FontWeight.bold),
  //                     ),
  //                     Text(
  //                       'food collection ',
  //                       style: TextStyle(fontWeight: FontWeight.bold),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         height: 250,
  //         width: 100,
  //         child: Column(
  //           children: [
  //             Container(
  //               height: 150,
  //               width: 150,
  //               decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/food2.jpg"))),
  //             ),
  //             Container(
  //               height: 20,
  //               width: 150,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(
  //                   left: 35,
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(left: 14),
  //                   child: Text(
  //                     "food collection",
  //                     style: TextStyle(fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Container(
  //           height: 250,
  //           width: 100,
  //           child: Column(
  //             children: [
  //               Container(
  //                 height: 150,
  //                 width: 150,
  //                 decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                         image: AssetImage("assets/food3.jpg"))),
  //               ),
  //               Container(
  //                 height: 20,
  //                 width: 150,
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(
  //                     left: 25,
  //                   ),
  //                   child: Text(
  //                     "food collection ",
  //                     style: TextStyle(fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //               )
  //             ],
  //           )),
  //       Container(
  //           height: 50,
  //           width: 100,
  //           child: Column(
  //             children: [
  //               Container(
  //                 height: 150,
  //                 width: 150,
  //                 decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                         image: AssetImage("assets/food4.jpg"))),
  //               ),
  //               Container(
  //                 height: 20,
  //                 width: 150,
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(
  //                     left: 25,
  //                   ),
  //                   child: Text(
  //                     "fast fooD",
  //                     style: TextStyle(fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //               )
  //             ],
  //           )),
  //       Container(
  //         height: 250,
  //         width: 100,
  //         child: Column(
  //           children: [
  //             Container(
  //               height: 150,
  //               width: 150,
  //               decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/food5.jpg"))),
  //             ),
  //             Container(
  //               height: 20,
  //               width: 150,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(
  //                   left: 35,
  //                 ),
  //                 child: Text(
  //                   "fast fooD",
  //                   style: TextStyle(fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         height: 250,
  //         width: 100,
  //         child: Column(
  //           children: [
  //             Container(
  //               height: 150,
  //               width: 150,
  //               decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/food6.jpg"))),
  //             ),
  //             Container(
  //               height: 20,
  //               width: 150,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(
  //                   left: 35,
  //                 ),
  //                 child: Text(
  //                   "fast fooD",
  //                   style: TextStyle(fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         height: 250,
  //         width: 100,
  //         child: Column(
  //           children: [
  //             Container(
  //               height: 150,
  //               width: 150,
  //               decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/food7.jpg"))),
  //             ),
  //             Container(
  //               height: 20,
  //               width: 150,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(
  //                   left: 35,
  //                 ),
  //                 child: Text(
  //                   "fast fooD",
  //                   style: TextStyle(fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         height: 250,
  //         width: 100,
  //         child: Column(
  //           children: [
  //             Container(
  //               height: 150,
  //               width: 150,
  //               decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/food8.jpg"))),
  //             ),
  //             Container(
  //               height: 20,
  //               width: 150,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(
  //                   left: 35,
  //                 ),
  //                 child: Text(
  //                   "fast fooD",
  //                   style: TextStyle(fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         height: 250,
  //         width: 100,
  //         child: Column(
  //           children: [
  //             Container(
  //               height: 150,
  //               width: 150,
  //               decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/food9.jpg"))),
  //             ),
  //             Container(
  //               height: 20,
  //               width: 150,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(
  //                   left: 35,
  //                 ),
  //                 child: Text(
  //                   "fast fooD",
  //                   style: TextStyle(fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         height: 250,
  //         width: 100,
  //         child: Column(
  //           children: [
  //             Container(
  //               height: 150,
  //               width: 150,
  //               decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/food10.jpg"))),
  //             ),
  //             Container(
  //               height: 20,
  //               width: 150,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(
  //                   left: 35,
  //                 ),
  //                 child: Text(
  //                   "fast fooD",
  //                   style: TextStyle(fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         height: 250,
  //         width: 100,
  //         child: Column(
  //           children: [
  //             Container(
  //               height: 150,
  //               width: 150,
  //               decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/food5.jpg"))),
  //             ),
  //             Container(
  //               height: 20,
  //               width: 150,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(
  //                   left: 35,
  //                 ),
  //                 child: Text(
  //                   "fast fooD",
  //                   style: TextStyle(fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ])
//         );
//   }
// }


