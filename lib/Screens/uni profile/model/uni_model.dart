class UniModel {
  String name; //
  int collegeNumber;
  String uniType; //
  String uniLink; //
  String address; //
  String contactNumber; //
  int acceptedPercentage;
  String image;
  String uniStatusType;
  String description;
  String id;

  UniModel({
    required this.name,
    required this.collegeNumber,
    required this.uniType,
    required this.uniLink,
    required this.address,
    required this.contactNumber,
    required this.acceptedPercentage,
    required this.image,
    required this.uniStatusType,
    required this.description,
    required this.id,
  });

  factory UniModel.fromJson(Map<String, dynamic> json) => UniModel(
        name: json['name'],
        collegeNumber: json['collegeNumber'],
        uniType: json['uniType'],
        uniLink: json['uniLink'],
        address: json['address'],
        contactNumber: json['contactNumber'],
        acceptedPercentage: json['acceptedPercentage'],
        image: json['image'],
        uniStatusType: json['uniStatusType'],
        description: json['description'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'collegeNumber': collegeNumber,
      'uniType': uniType,
      'uniLink': uniLink,
      'address': address,
      'contactNumber': contactNumber,
      'acceptedPercentage': acceptedPercentage,
      'image': image,
      'uniStatusType': uniStatusType,
      'description': description,
      'id': id,
    };
  }
}
