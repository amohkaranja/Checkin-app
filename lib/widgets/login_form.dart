// ignore_for_file: avoid_print
import 'package:checkin/screens/student_home.dart';
import 'package:flutter/material.dart';
import '../utils/apis_list.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late String _username = "", _password = "";
  String _errorMessage = "";
  submit() {
    setState(() {
      _errorMessage = "";
    });
    var data = {"email": _username, "password": _password};
    login(
        data,
        (result, error) => {
              if (result == null)
                {
                  print(error),
                  setState(() {
                    _errorMessage = error;
                  })
                }
              else
                {
                  print(result),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentHomeScreen()),
                  )
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _errorMessage != ""
                ? Container(
                    height: 20,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: const BoxDecoration(),
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      "$_errorMessage",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                : Container(height: 1),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    gapPadding: 10.0,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
              onSaved: (value) => _username = value!,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    gapPadding: 10.0,
                  )),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              onSaved: (value) => _password = value!,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff008346),
              ),
              onPressed: () {
                submit();
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Use _username and _password to log in
                }
              },
              child: const Text('Log in'),
            ),
          ],
        ),
      ),
    );
  }
}
