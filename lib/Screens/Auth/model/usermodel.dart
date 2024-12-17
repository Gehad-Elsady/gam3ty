class UserModel {
  String name;
  String email;
  String id;
  String role;

  UserModel(
      {required this.name,
      required this.email,
      this.id = "",
      required this.role});

  UserModel.fromJason(Map<String, dynamic> jason)
      : this(
          name: jason["name"],
          email: jason["email"],
          id: jason["id"],
          role: jason["role"],
        );

  Map<String, dynamic> toJason() {
    return {
      "name": name,
      "email": email,
      "id": id,
      "role": role,
    };
  }
}
