class User {
  final String password;
  final String email;

  User(this.password, this.email);
}

class Institution {
  final int id;
  final String name;

  Institution({required this.id, required this.name});
}
