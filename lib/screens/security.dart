import 'package:flutter/material.dart';
import 'user_profile.dart';
import 'student_home.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Security",
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

          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                gapPadding: 5.0,
              ),
            ),
            onSaved: (value) => {},
            onChanged: (value) {
           
            },
          ),
             TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                gapPadding: 5.0,
              ),
            ),
            onSaved: (value) => {},
            onChanged: (value) {
           
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'confirm password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  gapPadding: 10.0,
                )),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter confirm password';
              } 

              return null;
            },
            onEditingComplete: () {
              
            },
          ),
              Padding(
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
          ])
       )
    );
  }
}