import 'package:flutter/material.dart';
import 'package:flutter_bing_1/home2_Screen.dart';
import 'package:flutter_bing_1/homescreen.dart';
import 'package:flutter_bing_1/read_data.dart';
import 'package:flutter_bing_1/widget.dart/form_desing.dart';
import 'package:flutter_bing_1/widget.dart/teacher_view.dart';

class manepage extends StatefulWidget {
  const manepage({super.key});

  @override
  State<manepage> createState() => _manepageState();
}

class _manepageState extends State<manepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 232, 231),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 90, left: 20),
                child: Text(
                  'School Managment',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 39),
                ),
              ),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 22, 4, 3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/school.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => form_desing()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                        ),
                        color: Color.fromARGB(255, 255, 255, 0),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(251, 21, 21, 21),
                            blurRadius: 12,
                            offset: Offset(0, 10),
                          ),
                        ]),
                    child: Center(
                        child: Text(
                      'Add Teacher',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => view_teacher()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                        ),
                        color: Color.fromARGB(255, 255, 255, 0),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(251, 21, 21, 21),
                            blurRadius: 12,
                            offset: Offset(0, 10),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40, left: 14),
                      child: Text(
                        'Teachers Data',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => homescreen()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                        ),
                        color: Color.fromARGB(255, 255, 255, 0),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(251, 21, 21, 21),
                            blurRadius: 12,
                            offset: Offset(0, 10),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40, left: 17),
                      child: Text(
                        'Add Student',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => reda_data()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                        ),
                        color: Color.fromARGB(255, 255, 255, 0),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(251, 21, 21, 21),
                            blurRadius: 12,
                            offset: Offset(0, 10),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40, left: 17),
                      child: Text(
                        'Student Data',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                  ),
                  color: Color.fromARGB(255, 255, 255, 0),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(4, 10)),
                  ]),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => home_screen()),
                        );
                      },
                      icon: Icon(
                        Icons.book,
                        color: Color.fromARGB(255, 247, 42, 27),
                        size: 24.0,
                      ),
                      label: Text(
                        'Assigment',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 16),
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 20, left: 10, top: 20),
                    height: 70,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: []),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.verified,
                        color: Color.fromARGB(255, 247, 42, 27),
                        size: 24.0,
                      ),
                      label: Text(
                        'Attendance',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 16),
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 20, left: 10, top: 20),
                    height: 70,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: TextButton.icon(
                      onPressed: () {
                        print(' hhy');
                      },
                      icon: Icon(
                        Icons.text_snippet,
                        color: Color.fromARGB(255, 247, 42, 27),
                        size: 24.0,
                      ),
                      label: Text(
                        'Daily Test',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 16),
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 20, left: 10, top: 20),
                    height: 70,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  child: TextButton.icon(
                    onPressed: () {
                      print(' hhy');
                    },
                    icon: Icon(
                      Icons.text_snippet,
                      color: Color.fromARGB(255, 17, 15, 15),
                      size: 24.0,
                    ),
                    label: Text(
                      'Daily Test',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w900,
                          fontSize: 16),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 20, top: 20),
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                      ),
                      color: Color.fromARGB(255, 255, 255, 0),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(251, 21, 21, 21),
                          blurRadius: 12,
                          offset: Offset(0, 10),
                        ),
                      ]),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    height: 100,
                    width: 150,
                    child: TextButton.icon(
                      onPressed: () {
                        print(' hhy');
                      },
                      icon: Icon(
                        Icons.text_snippet,
                        color: Color.fromARGB(255, 22, 7, 6),
                        size: 24.0,
                      ),
                      label: Text(
                        'Daily Test',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w900,
                            fontSize: 16),
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                        ),
                        color: Color.fromARGB(255, 255, 255, 0),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(251, 21, 21, 21),
                            blurRadius: 12,
                            offset: Offset(0, 10),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
