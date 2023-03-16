import 'package:flutter/material.dart';
import 'user_profile.dart';
class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My QR Code",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
        ),
        backgroundColor: const Color(0xff008346),
      ),
      body: Column(children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 140,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ]),
              child: const Image(
                image: AssetImage("assets/images/logo_jpg.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 1,
              blurRadius: 15,
            )
          ]),
          child: Center(
            child: Card(
              child: SizedBox(
                width: 350,
                height: 130,
                child: Center(
                  child: Column(children: const <Widget>[
                    Image(
                      image: AssetImage("assets/images/qr_code_black.png"),
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    Text("Scanned Class")
                  ]),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 1,
                  blurRadius: 15,
                )
              ]),
              child: Center(
                child: Card(
                  child: SizedBox(
                    width: 170,
                    height: 130,
                    child: Center(
                      child: Column(children: const <Widget>[
                        Image(
                          image: AssetImage("assets/images/chalk_board.png"),
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        Text("Registered class")
                      ]),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 1,
                  blurRadius: 15,
                )
              ]),
              child: Center(
                child: Card(
                  child: SizedBox(
                    width: 170,
                    height: 130,
                    child: Center(
                      child: Column(children: const <Widget>[
                        Image(
                          image: AssetImage("assets/images/time_machine.png"),
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        Text("Scanned Activities")
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 1,
              blurRadius: 15,
            )
          ]),
          child: Center(
            child: Card(
              child: SizedBox(
                width: 350,
                height: 130,
                child: Center(
                  child: Column(children: const <Widget>[
                    Image(
                      image: AssetImage("assets/images/blue_qr_code.png"),
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    Text("Generate my code")
                  ]),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          height: 70,
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
        )
      ]),
    );
  }
}
