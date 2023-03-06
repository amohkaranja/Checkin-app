class User {
  final String password;
  final String email;

  User(this.password, this.email);
}

class Institution {
  final int id;
  final String created_at;
  final String updated_at;
  final String deleted_at;
  final String created_by;
  final String updated_by;
  final String is_active;
  final String institution_name;
  final String institution_code;
  final String description;
  final String short_name;

  Institution(
      this.created_at,
      this.updated_at,
      this.deleted_at,
      this.created_by,
      this.updated_by,
      this.is_active,
      this.institution_name,
      this.institution_code,
      this.description,
      this.short_name,
      this.id);
}
