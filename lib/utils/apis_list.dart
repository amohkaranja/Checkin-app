import 'dart:convert';
import 'package:checkin/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Api {
  String login = "${dotenv.env['API_KEY']}api/auth/jwt/login/";
  String registerGroup = "${dotenv.env['API_KEY']}api/auth/groups/";
  String registerUser = "${dotenv.env['API_KEY']}api/auth/users/";
}

const api = "https://d1be-105-163-158-157.in.ngrok.io/";
// ignore: non_constant_identifier_names
/// login function
/// @param {JSON} data
/// @param{(error:JSON,result:JSON)} callback
void login(data, callback) async {
  var url = Uri.parse("${api}api/auth/jwt/login/");
  var response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));

  // print(response);
  var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
  // ignore: avoid_print
  if (response.statusCode == 200) {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token",jsonResponse["access"]);
    // ignore: void_checks
    return callback(jsonResponse["message"], null);
  }
  callback(null, jsonResponse["message"]);
}
void logout() async{
   final prefs = await SharedPreferences.getInstance();
     var token= (prefs.getString("token"));
  var url = Uri.parse("${api}api/auth/jwt/logout/");
  await http.get(url,headers:  <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':'Bearer ${token!}',
      },);
}

Future<Profile> profileData() async {
   final prefs = await SharedPreferences.getInstance();
     var token= (prefs.getString("token"));
  var url = Uri.parse("${api}api/auth/users/me");  await http.get(url,headers:  <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':'Bearer ${token!}',
      },);
    var response=  await http.get(url,headers:  <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':'Bearer ${token!}',
      },);
        var jsonResponse = convert.jsonDecode(response.body);
        Profile profile= await  Profile.fromJson(jsonResponse);
    return profile;

}
Future<bool> fetchDataAndSaveToPrefs() async {
  bool loading = true;
  // obtain shared preferences
  final prefs = await SharedPreferences.getInstance();
  String url = '${api}api/v1/institution/institutions/'; 
  var response = await http.get(Uri.parse(url));
  var data = json.decode(response.body);
  // Convert data to List<String>
  List<String> schools = [];
  if (data is List) {
    schools = List.castFrom(data);
  } else if (data is Map) {
  if (data != null && data["items"] != null) {
  data["items"].forEach((item) {
    schools.add("${item['institution_name']}:${item['id']}");
  });


}

  }
  // set value
  await prefs.setStringList("schools", schools);
  loading = false;
  
  return loading;
}


void post(dynamic data, String url, Function callback) async {
  var apiUrl = Uri.parse(api + url);
  var response = await http.post(apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));

  var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
  if (response.statusCode == 201) {
    // ignore: void_checks
    return callback("success", null);
  }
  callback(null, jsonResponse["message"]);
}
