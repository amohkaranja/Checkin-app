import 'package:flutter/material.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Sign Up"),
        backgroundColor: const Color(0xff008346),
      ),
      body: Center(
        child: Column(children: <Widget>[]),
      ),
    );
  }
}
