import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bing_1/mane_page.dart';

class reda_data extends StatefulWidget {
  const reda_data({super.key});

  @override
  State<reda_data> createState() => _reda_dataState();
}

class _reda_dataState extends State<reda_data> {
  final ContactEdit = TextEditingController();
  // final ContactEdit = TextEditingController();

  // final ContactEdit = TextEditingController();

  // final ContactEdit = TextEditingController();

  // final ContactEdit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: (() {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => manepage()));
          }),
        ),
        backgroundColor: Color.fromARGB(255, 255, 247, 0),
        title: Text(
          "User Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('userdata').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                      ),
                      boxShadow: [BoxShadow(blurRadius: 9)],
                      borderRadius: BorderRadius.circular(16),
                      color: Color.fromARGB(255, 206, 185, 185)),
                  height: 280,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "user_data",
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                              ),
                              child: Text(
                                " Name  : ",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                document['u_name'],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(" Father  : "),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                document['father_name'],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(" Contact : "),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                document['contact'],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Text('Gmail   :'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                document['email'],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(' Addres :'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text(
                                document['Addres'],
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(' Age       :'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Text(document['Age']),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 23, top: 10),
                            child: OutlinedButton(
                              child: Text(
                                ' Delete ',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 29, 28, 28),
                                elevation: 5,
                              ),
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection('userdata')
                                    .doc(document.id)
                                    .delete();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 90, top: 10),
                            child: OutlinedButton(
                              child: Text(
                                '    Edit     ',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Color.fromARGB(
                                  255,
                                  29,
                                  28,
                                  28,
                                ),
                                elevation: 5,
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: ((context) => SimpleDialog(
                                          children: [
                                            TextField(
                                              //  controller: NameEdit,
                                              decoration: InputDecoration(
                                                  labelText: "Name",
                                                  hintText:
                                                      document['teacher_name']),
                                            ),
                                            TextField(
                                              // controller: ClassEdit,
                                              decoration: InputDecoration(
                                                  labelText: "Class",
                                                  hintText: document['class']),
                                            ),
                                            TextField(
                                              // controller: SubjectEdit,
                                              decoration: InputDecoration(
                                                  labelText: "Subject",
                                                  hintText:
                                                      document['subject']),
                                            ),
                                            TextField(
                                              controller: ContactEdit,
                                              decoration: InputDecoration(
                                                  labelText: "Contact",
                                                  hintText:
                                                      document['contact']),
                                            ),
                                          ],
                                        )));
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
