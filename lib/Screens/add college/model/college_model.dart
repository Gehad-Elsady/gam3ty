class CollegeModel {
  String id;
  String uinId;
  String nameAr;
  String nameEn; //
  String collegePresidentAr;
  String collegePresidentEn; //
  String addressAr;
  String establishDate; //
  String addressEn; //
  String contactNumber; //
  String email; //
  String image; //
  String acceptedPercentage; //
  String uniLink; //
  String descriptionAr;
  String descriptionEn; //
  String studyingType; //
  String academicYear; //
  String Tuitionfees; //
  List<String> advantagesAr;
  List<String> advantagesEn; //
  List<String> disadvantagesAr;
  List<String> disadvantagesEn; //
  List<String> careerOpportunitiesArList;
  List<String> careerOpportunitiesEnList; //
  List<String> expectedJobsAr;
  List<String> expectedJobsEn; //

  CollegeModel({
    required this.id,
    required this.uinId,
    required this.nameAr,
    required this.nameEn,
    required this.collegePresidentAr,
    required this.collegePresidentEn,
    required this.addressAr,
    required this.addressEn,
    required this.establishDate, //
    required this.contactNumber,
    required this.email,
    required this.image,
    required this.acceptedPercentage,
    required this.uniLink,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.studyingType,
    required this.academicYear,
    required this.Tuitionfees,
    required this.advantagesAr,
    required this.advantagesEn,
    required this.disadvantagesAr,
    required this.disadvantagesEn,
    required this.careerOpportunitiesArList,
    required this.careerOpportunitiesEnList,
    required this.expectedJobsAr,
    required this.expectedJobsEn,
  });

  factory CollegeModel.fromJson(Map<String, dynamic> json) => CollegeModel(
        id: json['id'],
        uinId: json['uin_id'],
        nameAr: json['nameAr'],
        nameEn: json['nameEn'],
        collegePresidentAr: json['collegePresidentAr'],
        collegePresidentEn: json['collegePresidentEn'],
        addressAr: json['addressAr'],
        addressEn: json['addressEn'],
        contactNumber: json['contactNumber'],
        establishDate: json['establishDate'],
        email: json['email'],
        image: json['image'],
        acceptedPercentage: json['acceptedPercentage'],
        uniLink: json['uniLink'],
        descriptionAr: json['descriptionAr'],
        descriptionEn: json['descriptionEn'],
        studyingType: json['studyingType'],
        academicYear: json['academicYear'],
        Tuitionfees: json['Tuitionfees'],
        advantagesAr: List<String>.from(json['advantagesAr']),
        advantagesEn: List<String>.from(json['advantagesEn']),
        disadvantagesAr: List<String>.from(json['disadvantagesAr']),
        disadvantagesEn: List<String>.from(json['disadvantagesEn']),
        careerOpportunitiesArList:
            List<String>.from(json['careerOpportunitiesArList']),
        careerOpportunitiesEnList:
            List<String>.from(json['careerOpportunitiesEnList']),
        expectedJobsAr: List<String>.from(json['expectedJobsAr']),
        expectedJobsEn: List<String>.from(json['expectedJobsEn']),
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uin_id': uinId,
      'nameAr': nameAr,
      'nameEn': nameEn,
      'collegePresidentAr': collegePresidentAr,
      'collegePresidentEn': collegePresidentEn,
      'addressAr': addressAr,
      'addressEn': addressEn,
      'contactNumber': contactNumber,
      'email': email,
      'image': image,
      'acceptedPercentage': acceptedPercentage,
      'uniLink': uniLink,
      'descriptionAr': descriptionAr,
      'descriptionEn': descriptionEn,
      'studyingType': studyingType,
      'establishDate': establishDate,
      'academicYear': academicYear,
      'Tuitionfees': Tuitionfees,
      'advantagesAr': advantagesAr,
      'advantagesEn': advantagesEn,
      'disadvantagesAr': disadvantagesAr,
      'disadvantagesEn': disadvantagesEn,
      'careerOpportunitiesArList': careerOpportunitiesArList,
      'careerOpportunitiesEnList': careerOpportunitiesEnList,
      'expectedJobsAr': expectedJobsAr,
      'expectedJobsEn': expectedJobsEn
    };
  }
}
