import 'package:flutter/material.dart';

class User_Profile extends StatefulWidget {
  const User_Profile({super.key});

  @override
  State<User_Profile> createState() => _User_ProfileState();
}

class _User_ProfileState extends State<User_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text(
          "My QR Code",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w600,color:  Color(0xff008346)),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(children:<Widget> [
           
           Container(
             
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,),
                child: Container(
                  height: 140,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xff008346),width: 2.0),
                      ),
                  child: const Image(
                    image: AssetImage("assets/images/logo_jpg.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(child: Column(children: const <Widget>[
              Text("Stepehen Muraya",style: TextStyle(fontWeight: FontWeight.w600,fontStyle: FontStyle.italic),),
              Text("gathaiya28@gmail.com",style: TextStyle(fontStyle: FontStyle.italic,color: Colors.blue),),
              Text("J17/MNU/033/2017",style: TextStyle(fontStyle: FontStyle.italic)),
              Text("0798230245",style: TextStyle(fontWeight: FontWeight.w300,fontStyle: FontStyle.italic)),
            ]),),
          ),
     
      Card(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
            children: const [
              Text("Classes Registered",style: TextStyle(color: Color(0xff008346)),),
              Text("2")
            ],
          ),Column(
            children: const [
              Text("Classes signed",style: TextStyle(color: Color(0xff008346))),
              Text("2")
            ],
          )
                  ],
                  )),
        ),
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            child: Row(
              children: [
                const Image(
                        image: AssetImage("assets/images/edit.png"),
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0,),
                        child: Column(children: const [
                          Text("Account",style: TextStyle(fontWeight: FontWeight.w600),),
                          Text("Edit personal information",style: TextStyle(fontWeight: FontWeight.w300,fontStyle: FontStyle.italic))
                        ],),
                      )
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            child: Row(
              children: [
                const Image(
                        image: AssetImage("assets/images/key.png"),
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0,),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                          Text("Security",style: TextStyle(fontWeight: FontWeight.w600),),
                          Text("Change password",style: TextStyle(fontWeight: FontWeight.w300,fontStyle: FontStyle.italic))
                        ],),
                      )
              ],
            ),
          ), Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            child: Row(
              children: [
                const Image(
                        image: AssetImage("assets/images/acknowledgement.png"),
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0,),
                        child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                          
                          Text("Acknowledment",style: TextStyle(fontWeight: FontWeight.w600),),
                          Text("Public testers and appreciation list",style: TextStyle(fontWeight: FontWeight.w300,fontStyle: FontStyle.italic))
                        ],),
                      )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const <Widget>[
                      Image(
                        image: AssetImage("assets/images/home.png"),
                        height: 40,
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
                        child: Image(
                          image: AssetImage("assets/images/account.png"),
                          height: 40,
                        ),
                      ),
                      Text("Profile")
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      )
        ]),
      ),
    );
  }
}