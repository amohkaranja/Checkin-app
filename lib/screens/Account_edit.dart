import 'package:flutter/material.dart';

class Account_Edit extends StatefulWidget {
  const Account_Edit({super.key});

  @override
  State<Account_Edit> createState() => _Account_EditState();
}

class _Account_EditState extends State<Account_Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
        title: const Text(
          "Account Edit",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
        ),
        backgroundColor: const Color(0xff008346),
      ),
      body: Column(children:<Widget> [
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
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'First name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        gapPadding: 5.0,
                      ),
                    ),
                    onSaved: (value) => {},
                    onChanged: (value) {
                  
                    },
                  ),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                      labelText: 'Last name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        gapPadding: 5.0,
                      ),
                                ),
                                onSaved: (value) => {},
                                onChanged: (value) {
                                
                                },
                              ),
                  ),
                ),
            
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email address',
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
                ),
              ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Phone no.(254)',
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
                ),
              ),
                  ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff008346),
              ),
              onPressed: () {
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Update'),
              ),
            ),  
              ]),
    );
  }
}