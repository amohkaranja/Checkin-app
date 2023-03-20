import 'dart:math';

import 'package:flutter/material.dart';
import 'user_profile.dart';
import 'student_home.dart';

class MyClasses extends StatefulWidget {
  const MyClasses({super.key});

  @override
  State<MyClasses> createState() => _MyClassesState();
}

class _MyClassesState extends State<MyClasses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text(
          "My Classes",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w600,color:  Color(0xff008346)),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children:[ Column(
          children: <Widget>[
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      const Image(
                              image: AssetImage("assets/images/chalk_board.png"),
                              height: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                              child: Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                  Text("SCO402",style: TextStyle(fontWeight: FontWeight.w600),),
                                  Text("LEGAL AND ETHICAL ISSUES IN COMPUTING",style: TextStyle(fontWeight: FontWeight.w300,fontStyle: FontStyle.italic)),
                                  Text("Muthee Kiengei",style: TextStyle(fontWeight: FontWeight.w300,fontStyle: FontStyle.italic)),
                                  Text("2021-12-09")
                                ],),
                              ),
                            ),
                         
                    ],
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      const Image(
                              image: AssetImage("assets/images/chalk_board.png"),
                              height: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                              child: Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                  Text("SCO402",style: TextStyle(fontWeight: FontWeight.w600),),
                                  Text("LEGAL AND ETHICAL ISSUES IN COMPUTING",style: TextStyle(fontWeight: FontWeight.w300,fontStyle: FontStyle.italic)),
                                  Text("Muthee Kiengei",style: TextStyle(fontWeight: FontWeight.w300,fontStyle: FontStyle.italic)),
                                  Text("2021-12-09")
                                ],),
                              ),
                            ),
                         
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
                       Positioned(
              left: 0,
            bottom: 0,
            right: 0,
               child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children:  <Widget>[
                          
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentHomeScreen()),
                        );
                            },
                            child: Image(
                              image: AssetImage("assets/images/home.png"),
                              height: 40,
                            ),
                          ),
                          Text("Home")
                        ],
                      ),
                      Column(
                        children:  [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => User_Profile()),
                        );
                            },
                            child: const Image(
                              image: AssetImage("assets/images/account.png"),
                              height: 40,
                            ),
                          ),
                          const Text("Profile")
                        ],
                      )
                    ],
                  ),
                ),
                         ),
             ),
        ]
      ),
    );
  }
}