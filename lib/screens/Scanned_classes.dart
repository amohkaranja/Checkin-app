import 'package:checkin/screens/student_home.dart';
import 'package:checkin/screens/user_profile.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../utils/apis_list.dart';

class ScannedClasses extends StatefulWidget {
  const ScannedClasses({super.key});

  @override
  State<ScannedClasses> createState() => _ScannedClassesState();
}

class _ScannedClassesState extends State<ScannedClasses> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: const Text(
          "Scanned classes",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
        ),
        backgroundColor: const Color(0xff008346),
      ),
      body: Stack(children:<Widget> [
         Column(
           children: [
             Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Image(
                                  image: AssetImage("assets/images/blue_qr_code.png"),
                                  height: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                                  child: Expanded(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                      Text("2022-08-04",style: TextStyle(fontWeight: FontWeight.w600),),
                                      Text("SCO402",style: TextStyle(fontWeight: FontWeight.w300,fontStyle: FontStyle.italic)),
                                      Text("Muthee Kiengei",style: TextStyle(fontWeight: FontWeight.w300,fontStyle: FontStyle.italic))
                                    ],),
                                  ),
                                ),
                                Expanded(child: Column(children: [Text("12:50pm",style: TextStyle(fontWeight: FontWeight.w600))],))
                             
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
                                  image: AssetImage("assets/images/blue_qr_code.png"),
                                  height: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                                  child: Expanded(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                      Text("2022-08-04",style: TextStyle(fontWeight: FontWeight.w600),),
                                      Text("SCO402",style: TextStyle(fontWeight: FontWeight.w300,fontStyle: FontStyle.italic)),
                                      Text("Muthee Kiengei",style: TextStyle(fontWeight: FontWeight.w300,fontStyle: FontStyle.italic))
                                    ],),
                                  ),
                                ),
                                Expanded(child: Column(children: [Text("12:50pm",style: TextStyle(fontWeight: FontWeight.w600))],))
                             
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
      ]),
    )
    ;
  }
}