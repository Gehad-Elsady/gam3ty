class AddUinModel {
  String id;
  String uinNameAr; //
  String uinNameEn; //
  String establishDate; //
  String numberOfColleges; //
  String numberOfStudents; //
  String numberOfTeachers; //
  String universityPresidentAr; //
  String universityPresidentEn; //
  String addressAr; //
  String addressEn; //
  String contactNumber;
  String email;
  String image; //
  String acceptedPercentage; //
  String uniLink;
  String descriptionAr; //
  String descriptionEn; //
  String studyingType; //
  List<String> advantagesAr; //
  List<String> advantagesEn; //
  List<String> disadvantagesAr;
  List<String> disadvantagesEn; //
  List<String> allowCitiesAr; //
  List<String> allowCitiesEn; //
  String uniType;
  String? latitude;
  String? longitude;

  AddUinModel({
    required this.id,
    required this.uinNameAr,
    required this.uinNameEn,
    required this.establishDate,
    required this.numberOfColleges,
    required this.numberOfStudents,
    required this.numberOfTeachers,
    required this.universityPresidentAr,
    required this.universityPresidentEn,
    required this.addressAr,
    required this.addressEn,
    required this.contactNumber,
    required this.email,
    required this.image,
    required this.acceptedPercentage,
    required this.uniLink,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.studyingType,
    required this.advantagesAr,
    required this.advantagesEn,
    required this.disadvantagesAr,
    required this.disadvantagesEn,
    required this.allowCitiesAr,
    required this.allowCitiesEn,
    this.latitude,
    this.longitude,
    required this.uniType,
  });

  factory AddUinModel.fromJson(Map<String, dynamic> json) {
    return AddUinModel(
      id: json['id'],
      uinNameAr: json['uinNameAr'],
      uinNameEn: json['uinNameEn'],
      establishDate: json['establishDate'],
      numberOfColleges: json['numberOfColleges'],
      numberOfStudents: json['numberOfStudents'],
      numberOfTeachers: json['numberOfTeachers'],
      universityPresidentAr: json['universityPresidentAr'],
      universityPresidentEn: json['universityPresidentEn'],
      addressAr: json['addressAr'],
      addressEn: json['addressEn'],
      contactNumber: json['contactNumber'],
      email: json['email'],
      image: json['image'],
      acceptedPercentage: json['acceptedPercentage'],
      uniLink: json['uniLink'],
      descriptionAr: json['descriptionAr'],
      descriptionEn: json['descriptionEn'],
      studyingType: json['studyingType'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      advantagesAr: List<String>.from(json['advantagesAr']),
      advantagesEn: List<String>.from(json['advantagesEn']),
      disadvantagesAr: List<String>.from(json['disadvantagesAr']),
      disadvantagesEn: List<String>.from(json['disadvantagesEn']),
      allowCitiesAr: List<String>.from(json['allowCitiesAr']),
      allowCitiesEn: List<String>.from(json['allowCitiesEn']),
      uniType: json['uniType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uinNameAr': uinNameAr,
      'uinNameEn': uinNameEn,
      'establishDate': establishDate,
      'numberOfColleges': numberOfColleges,
      'numberOfStudents': numberOfStudents,
      'numberOfTeachers': numberOfTeachers,
      'universityPresidentAr': universityPresidentAr,
      'universityPresidentEn': universityPresidentEn,
      'addressAr': addressAr,
      'addressEn': addressEn,
      'contactNumber': contactNumber,
      'email': email,
      'image': image,
      'acceptedPercentage': acceptedPercentage,
      'uniLink': uniLink,
      'descriptionAr': descriptionAr,
      'descriptionEn': descriptionEn,
      'longitude': longitude,
      'latitude': latitude,
      'studyingType': studyingType,
      'advantagesAr': advantagesAr,
      'advantagesEn': advantagesEn,
      'disadvantagesAr': disadvantagesAr,
      'disadvantagesEn': disadvantagesEn,
      'allowCitiesAr': allowCitiesAr,
      'allowCitiesEn': allowCitiesEn,
      'uniType': uniType,
    };
  }

//   String toString() {
//     return '''
// AddUinModel(
//   id: $id,
//   uinNameAr: $uinNameAr,
//   uinNameEn: $uinNameEn,
//   establishDate: $establishDate,
//   numberOfColleges: $numberOfColleges,
//   numberOfStudents: $numberOfStudents,
//   numberOfTeachers: $numberOfTeachers,
//   universityPresidentAr: $universityPresidentAr,
//   universityPresidentEn: $universityPresidentEn,
//   addressAr: $addressAr,
//   addressEn: $addressEn,
//   contactNumber: $contactNumber,
//   email: $email,
//   image: $image,
//   acceptedPercentage: $acceptedPercentage,
//   uniLink: $uniLink,
//   descriptionAr: $descriptionAr,
//   descriptionEn: $descriptionEn,
//   studyingType: $studyingType,
//   advantagesAr: ${advantagesAr.join(', ')},
//   advantagesEn: ${advantagesEn.join(', ')},
//   disadvantagesAr: ${disadvantagesAr.join(', ')},
//   disadvantagesEn: ${disadvantagesEn.join(', ')},
//   allowCitiesAr: ${allowCitiesAr.join(', ')},
//   allowCitiesEn: ${allowCitiesEn.join(', ')}
//   latitude: $latitude,
//   longitude: $longitude,
// )
// ''';
}
