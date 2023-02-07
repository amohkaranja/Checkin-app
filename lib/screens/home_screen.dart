import 'package:checkin/models/user_model.dart';
import 'package:checkin/widgets/login_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String password = "";
  final String email = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff008346),
            title: Text(""),
            elevation: 0.0,
          ),
          backgroundColor: Color(0xff008346),
          body: Column(
            children: <Widget>[
              Container(
                height: 40.0,
                decoration: BoxDecoration(color: Colors.white),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 200.0,
                          width: 250.0,
                          child: Image(
                              image: AssetImage("assets/images/logo.png")),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      // height: 200.0
                      width: 400.0,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: LoginForm(),
                    )
                  ]),
                ),
              )
            ],
          )),
    );
  }
}
