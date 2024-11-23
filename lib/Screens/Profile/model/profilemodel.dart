class ProfileModel {
  String firstName;
  String lastName;
  String address;
  String phoneNumber;
  String email;
  String id;
  String profileImage;

  // Constructor
  ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.id,
    required this.profileImage,
  });

  // Method to convert the profile to a Map (useful for JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'phoneNumber': phoneNumber,
      // 'city': city,
      // 'state': state,
      'email': email,
      'profileImage': profileImage
    };
  }

  // Factory method to create a ProfileModel from JSON
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      // city: json['city'],
      // state: json['state'],
      id: json['id'],
      profileImage: json['profileImage'],
    );
  }
}
