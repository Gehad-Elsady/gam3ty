class UserModel {
  String name;
  String email;
  String id;

  UserModel({required this.name, required this.email, this.id = ""});

  UserModel.fromJason(Map<String, dynamic> jason)
      : this(
          name: jason["name"],
          email: jason["email"],
          id: jason["id"],
        );

  Map<String, dynamic> toJason() {
    return {
      "name": name,
      "email": email,
      "id": id,
    };
  }
}
