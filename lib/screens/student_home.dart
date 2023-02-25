import 'package:flutter/material.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My QR Code",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 150,
              padding: EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage("assets/images/logo_jpg.png"),
                fit: BoxFit.contain,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ]),
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
                height: 110,
                child: Center(
                  child: Column(children: <Widget>[
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
                    height: 110,
                    child: Center(
                      child: Column(children: <Widget>[
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
                    height: 110,
                    child: Center(
                      child: Column(children: <Widget>[
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
                height: 110,
                child: Center(
                  child: Column(children: <Widget>[
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
      ]),
    );
  }
}
