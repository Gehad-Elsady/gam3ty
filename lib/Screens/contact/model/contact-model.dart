class ContactModel {
  final String name;
  final String email;
  final String message;
  final String id;

  ContactModel({
    required this.name,
    required this.email,
    required this.message,
    required this.id,
  });
  static ContactModel fromJson(Map<String, dynamic> json) {
    return ContactModel(
      name: json['name'],
      email: json['email'],
      message: json['message'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'message': message,
      'id': id,
    };
  }
}
