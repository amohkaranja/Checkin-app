import 'dart:convert'; // to parse JSON

class User {
  final String password;
  final String email;

  User(this.password, this.email);
}

class Institution {
  String id;
  String name;

  Institution({required this.id, required this.name});

  factory Institution.fromJson(Map<String, dynamic> json) {
    return Institution(
      id: json['id'],
      name: json['institution_name'],
    );
  }
}
