import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bing_1/mane_page.dart';
import 'package:flutter_bing_1/update_data.dart';
import 'package:get/get.dart';

class view_teacher extends StatefulWidget {
  const view_teacher({super.key});

  @override
  State<view_teacher> createState() => _view_teacherState();
}

class _view_teacherState extends State<view_teacher> {
  final NameEdit = TextEditingController();
  final ClassEdit = TextEditingController();
  final SubjectEdit = TextEditingController();
  final ContactEdit = TextEditingController();

 // var teacher_name;

  // String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: (() {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => manepage()));
            }),
          ),
          centerTitle: true,
          title: Text(
            "Collage Details",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.black),
          ),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('teacher_data')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                            ),
                            boxShadow: [BoxShadow(blurRadius: 5)],
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromARGB(255, 53, 154, 236),
                                Color.fromARGB(255, 83, 97, 191),
                              ],
                            )),
                        child: Column(
                          //  crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                                      document['teacher_name'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
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
                                    child: Text("  Class  : "),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      document['class'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
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
                                    child: Text(" subject : "),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      document['subject'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
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
                                    child: Text(" Contact: "),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      document[' '],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    // FirebaseFirestore.instance
                                    //     .collection('teacher_data')
                                    //     .doc(document.id)
                                    //     .update({'teacher_name': teacher_name});

                                    // Navigator.of(context)
                                    //     .pushReplacement(MaterialPageRoute(
                                    //   builder: (context) => update_data(),
                                    // ));
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            SimpleDialog(children: [
                                              TextField(
                                                controller: NameEdit,
                                                decoration: InputDecoration(
                                                    labelText: "Name",
                                                    hintText: document[
                                                        'teacher_name']),
                                              ),
                                              TextField(
                                                controller: ClassEdit,
                                                decoration: InputDecoration(
                                                    labelText: "Class",
                                                    hintText:
                                                        document['class']),
                                              ),
                                              TextField(
                                                controller: SubjectEdit,
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
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            "teacher_data")
                                                        .doc(document.id)
                                                        .update({
                                                      //  "class": "samiiii",
                                                      "teacher_name":
                                                          NameEdit.text,
                                                      "class": ClassEdit.text,
                                                      "subject":
                                                          SubjectEdit.text,
                                                      "contact":
                                                          ContactEdit.text,
                                                    }).then((_) {
                                                      //  getLoginUserProduct();
                                                    });
                                                  },
                                                  child: Text('submit'))
                                            ]));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 30, top: 15),
                                    height: 50,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(251, 255, 250, 250),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black,
                                              spreadRadius: 1,
                                              blurRadius: 8,
                                              offset: Offset(4, 4)),
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 17, 3, 163),
                                              spreadRadius: 3,
                                              blurRadius: 8,
                                              offset: Offset(4, 4))
                                        ]),
                                    child: Center(
                                        child: Text(
                                      'Edit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800),
                                    )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await FirebaseFirestore.instance
                                        .collection('teacher_data')
                                        .doc(document.id)
                                        .delete();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 110, top: 25),
                                    height: 50,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(251, 255, 250, 250),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black,
                                              spreadRadius: 1,
                                              blurRadius: 8,
                                              offset: Offset(4, 4)),
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 17, 3, 163),
                                              spreadRadius: 3,
                                              blurRadius: 8,
                                              offset: Offset(4, 4))
                                        ]),
                                    child: Center(
                                        child: Text(
                                      'Delete',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800),
                                    )),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),

                    //   decoration: BoxDecoration(
                    //       border: Border.all(
                    //         width: 3,
                    //       ),
                    //       //  boxShadow: [BoxShadow(blurRadius: 9)],
                    //       borderRadius: BorderRadius.circular(16),
                    //       color: Color.fromARGB(255, 206, 185, 185)),
                    //   height: 280,
                    //   child: Column(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Text(
                    //           "Teacher Details",
                    //           style: TextStyle(
                    //               fontSize: 25,
                    //               color: Colors.black,
                    //               fontWeight: FontWeight.w900),
                    //         ),
                    //       ),
                    //       Container(
                    //         height: 30,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(16),
                    //         ),
                    //         child: Row(
                    //           children: [
                    //             Padding(
                    //               padding: const EdgeInsets.only(
                    //                 left: 30,
                    //               ),
                    //               child: Text(
                    //                 " Name  : ",
                    //                 style: TextStyle(
                    //                   fontSize: 15,
                    //                 ),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.only(left: 10),
                    //               child: Text(
                    //                 document['teacher_name'],
                    //                 style: TextStyle(
                    //                     fontSize: 15,
                    //                     fontWeight: FontWeight.w700),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         height: 25,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(12)),
                    //         child: Row(
                    //           children: [
                    //             Padding(
                    //               padding: const EdgeInsets.only(left: 30),
                    //               child: Text(" subject : "),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.only(left: 10),
                    //               child: Text(
                    //                 document['subject'],
                    //                 style: TextStyle(
                    //                     fontSize: 15,
                    //                     fontWeight: FontWeight.w700),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         height: 25,
                    //         child: Row(
                    //           children: [
                    //             Padding(
                    //               padding: EdgeInsets.only(left: 30),
                    //               child: Text(" Contact : "),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.only(left: 5),
                    //               child: Text(
                    //                 document['contact'],
                    //                 style: TextStyle(
                    //                     fontSize: 15,
                    //                     fontWeight: FontWeight.w700),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         height: 25,
                    //         child: Row(
                    //           children: [
                    //             Padding(
                    //               padding: const EdgeInsets.only(left: 35),
                    //               child: Text('class   :'),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.only(left: 15),
                    //               child: Text(
                    //                 document['class'],
                    //                 style: TextStyle(
                    //                     fontSize: 15,
                    //                     fontWeight: FontWeight.w700),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Row(
                    //         children: [
                    //           Padding(
                    //             padding:
                    //                 const EdgeInsets.only(left: 23, top: 10),
                    //             child: OutlinedButton(
                    //               child: Text(
                    //                 ' Delete ',
                    //                 style: TextStyle(color: Colors.white),
                    //               ),
                    //               style: OutlinedButton.styleFrom(
                    //                 backgroundColor:
                    //                     Color.fromARGB(255, 29, 28, 28),
                    //                 elevation: 5,
                    //               ),
                    //               onPressed: () {},
                    //             ),
                    //           ),
                    //           Padding(
                    //             padding:
                    //                 const EdgeInsets.only(left: 90, top: 10),
                    //             child: OutlinedButton(
                    //               child: Text(
                    //                 '    Edit     ',
                    //                 style: TextStyle(color: Colors.white),
                    //               ),
                    //               style: OutlinedButton.styleFrom(
                    //                 backgroundColor: Color.fromARGB(
                    //                   255,
                    //                   29,
                    //                   28,
                    //                   28,
                    //                 ),
                    //                 elevation: 5,
                    //               ),
                    //               onPressed: () {},
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  );
                }).toList(),
              );
            }));
  }
}

// Future editProduct(Document, teacher_name) async {
//   try {
//     await FirebaseFirestore.instance
//         .collection("teacher_data")
//         .doc(Document)
//         .update({"teacher_name": teacher_name}).then((_) {
//       //  getLoginUserProduct();
//     });
//   } catch (error) {
//     print(error);
//   }
//}
