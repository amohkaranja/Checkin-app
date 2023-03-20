import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Api {
  String login = "${dotenv.env['API_KEY']}api/auth/jwt/login/";
  String registerGroup = "${dotenv.env['API_KEY']}api/auth/groups/";
  String registerUser = "${dotenv.env['API_KEY']}api/auth/users/";
}

const api = "https://6a01-102-219-210-194.in.ngrok.io/";
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
  // const storage = FlutterSecureStorage();
  // ignore: avoid_print
  if (response.statusCode == 200) {
    // print(jsonResponse["access"]);
    // await storage.write(key: "access_token", value: jsonResponse["access"]);
    // ignore: void_checks
    return callback(jsonResponse["message"], null);
  }
  callback(null, jsonResponse["message"]);
}

void post(dynamic data, String url, Function callback) async {
  var apiUrl = Uri.parse(api + url);
  var response = await http.post(apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));

  var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
  print(jsonResponse);
  if (response.statusCode == 201) {
    // ignore: void_checks
    return callback("success", null);
  }
  callback(null, jsonResponse["message"]);
}
