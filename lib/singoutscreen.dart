import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bing_1/loginscreen.dart';
import 'package:flutter_bing_1/model/user_model.dart';

class singoutscreen extends StatefulWidget {
  const singoutscreen({super.key});

  @override
  State<singoutscreen> createState() => _singoutscreenState();
}

class _singoutscreenState extends State<singoutscreen> {
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
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 209, 38, 38),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: Column(
                        children: [
                          Text(
                            "${loggedInUser.firstName} ${loggedInUser.secondName}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "${loggedInUser.email}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 8, 214, 32),
                  image: DecorationImage(
                    image: AssetImage('assets/back.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined),
                iconColor: Colors.black,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginscreen()));
                },
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 190),
                  child: Text('Logout'),
                ),
              ),
            ],
          ),
        ),
        body: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              Container(
                //color: Colors.pink,
                height: 250,
                width: 100,
                child: Column(
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/food1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      height: 20,
                      width: 150,
                      // color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Text(
                          'delecious food',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                width: 100,
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/food2.jpg"))),
                    ),
                    Container(
                      height: 20,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 35,
                        ),
                        child: Text(
                          "fast fooD",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 250,
                  width: 100,
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/food3.jpg"))),
                      ),
                      Container(
                        height: 20,
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                          ),
                          child: Text(
                            "fast fooD",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )),
              Container(
                  height: 50,
                  width: 100,
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/food4.jpg"))),
                      ),
                      Container(
                        height: 20,
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                          ),
                          child: Text(
                            "fast fooD",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ))
            ]));
  }
}
