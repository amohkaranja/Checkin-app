import 'package:flutter/material.dart';
import '../utils/apis_list.dart';
import 'package:intl/intl.dart';
import '../models/user_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final _formKey = GlobalKey<FormState>();
  List<Institution> _institutions = [];
  Institution? _selectedInstitution;

  late String _username = "",
      _password = "",
      first_name = "",
      last_name = "",
      email = "",
      student_number = "";
  String _errorMessage = "";
  final List<String> titles = <String>['Mr', 'Mrs', 'Miss', 'Dr', 'Prof'];
  final List<String> genders = <String>['Male', 'Female', 'Others'];
  late String title = titles.first;
  late String gender = genders.first;
  bool _obscureText = true;

  submit() {
    setState(() {
      _errorMessage = "";
    });
    var data = {
      "first_name": first_name,
      "last_name": last_name,
      "other_names": title,
      "email": email,
      "password": _password,
      "gender": gender,
      "user_type": "STUDENT",
      "student_number": student_number,
      "institution_id": _selectedInstitution
    };
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
                }
            });
  }

  TextEditingController dateInput = TextEditingController();
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
    fetchInstitutions().then((institutions) {
      setState(() {
        _institutions = institutions;
      });
    });
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: title, // Set the selected value
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  title = value!;
                });
              },
              items: titles.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: _institutions.isNotEmpty
                ? DropdownButton<Institution>(
                    isExpanded: true,
                    // Set the selected value
                    value: _institutions[0],
                    onChanged: (Institution? newValue) {
                      setState(() {
                        _institutions[0] = newValue!;
                      });
                    },
                    items: _institutions.map<DropdownMenuItem<Institution>>(
                        (Institution value) {
                      return DropdownMenuItem<Institution>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                  )
                : CircularProgressIndicator(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  gapPadding: 5.0,
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter first name';
              }
              return null;
            },
            onSaved: (value) => first_name = value!,
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  gapPadding: 5.0,
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter last name';
              }
              return null;
            },
            onSaved: (value) => last_name = value!,
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  gapPadding: 5.0,
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter email';
              }
              return null;
            },
            onSaved: (value) => email = value!,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: gender, // Set the selected value
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  gender = value!;
                });
              },
              items: genders.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
              // padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              // height: MediaQuery.of(context).size.width / 3,
              child: Center(
                  child: TextField(
                controller: dateInput,
                //editing controller of this TextField
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Date of birth" //label text of field
                    ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      dateInput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
              ))),
          const SizedBox(
            height: 10.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Institution',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  gapPadding: 5.0,
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please select institution';
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
                labelText: 'Registration Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  gapPadding: 5.0,
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter registration number';
              }
              return null;
            },
            onSaved: (value) => student_number = value!,
          ),
          const SizedBox(
            height: 10.0,
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
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
            onSaved: (value) => _password = value!,
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
              if (_password != value) {
                return 'password does not match';
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
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

Future<List<Institution>> fetchInstitutions() async {
  final response = await http.get(Uri.parse(
      'https://admin.check-in.co.ke:6700/api/v1/institution/institutions/'));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return List<Institution>.from(
        json.map((i) => Institution(id: i['id'], name: i['name'])));
  } else {
    throw Exception('Failed to fetch institutions');
  }
}
