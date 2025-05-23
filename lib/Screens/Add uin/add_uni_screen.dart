import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Add%20uin/model/add_uin_model.dart';
import 'package:gam3ty/backend/Add%20uni/add_uni_back.dart';
import 'package:image_picker/image_picker.dart';

class AddUniScreen extends StatefulWidget {
  const AddUniScreen({super.key});

  @override
  State<AddUniScreen> createState() => _AddUniScreenState();
}

class _AddUniScreenState extends State<AddUniScreen> {
  int _currentStep = 0;

  // Controllers for text fields
  final TextEditingController idController = TextEditingController();
  final TextEditingController uinNameArController = TextEditingController();
  final TextEditingController uinNameEnController = TextEditingController();
  final TextEditingController establishDateController = TextEditingController();
  final TextEditingController numberOfCollegesController =
      TextEditingController();
  final TextEditingController numberOfStudentsController =
      TextEditingController();
  final TextEditingController numberOfTeachersController =
      TextEditingController();
  final TextEditingController universityPresidentArController =
      TextEditingController();
  final TextEditingController universityPresidentEnController =
      TextEditingController();
  final TextEditingController addressArController = TextEditingController();
  final TextEditingController addressEnController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController acceptedPercentageController =
      TextEditingController();
  final TextEditingController uniLinkController = TextEditingController();
  final TextEditingController descriptionArController = TextEditingController();
  final TextEditingController descriptionEnController = TextEditingController();
  final TextEditingController studyingTypeController = TextEditingController();

  // Lists for dropdowns and selected items
  final List<String> advantagesAr = [];
  final List<String> advantagesEn = [];
  final List<String> disadvantagesAr = [];
  final List<String> disadvantagesEn = [];
  final List<String> allowCitiesAr = [];
  final List<String> allowCitiesEn = [];
  String? selectedUniType;

  final List<String> uniType = [
    "Institutes",
    "national university",
    "Private universities",
    "Government universities",
    "Technology University"
  ];

  final List<String> availableAdvantagesAr = [
    'سمعة أكاديمية قوية',
    'توفير برامج أكاديمية متنوعة',
    'مرافق حديثة',
    'أعضاء هيئة تدريس ذوي خبرة',
    'فرص بحثية متميزة',
    'خدمات طلابية شاملة',
    'حياة طلابية نشطة',
    'دعم تقني متقدم',
    'تعاون مع جامعات ومؤسسات دولية',
    'مرافق رياضية عالية الجودة',
    'فرص تدريبية للعمل مع الشركات الكبرى',
    'تكنولوجيا متقدمة في التعليم',
    'إمكانية الدراسة عبر الإنترنت',
    'برامج تبادل ثقافي ودراسي',
    'دعم مالي للطلاب المتميزين',
    'دعم للأنشطة الطلابية',
    'بيئة تعليمية تشجع على التفكير النقدي',
    'شبكة خريجين قوية توفر فرص عمل',
    'إمكانية التخصص في مجالات متنوعة',
    'تعدد لغات التدريس'
  ];

  final List<String> availableAdvantagesEn = [
    'Strong academic reputation',
    'Diverse academic programs',
    'Modern facilities',
    'Experienced faculty members',
    'Outstanding research opportunities',
    'Comprehensive student services',
    'Active student life',
    'Advanced technological support',
    'International collaborations with universities and institutions',
    'High-quality sports facilities',
    'Training opportunities with major companies',
    'Advanced educational technology',
    'Online learning opportunities',
    'Cultural and academic exchange programs',
    'Financial support for outstanding students',
    'Support for student activities',
    'Learning environment encouraging critical thinking',
    'Strong alumni network providing job opportunities',
    'Opportunities to specialize in diverse fields',
    'Multilingual teaching options'
  ];

  final List<String> availableDisadvantagesAr = [
    'ارتفاع تكاليف الدراسة',
    'الازدحام في بعض المرافق',
    'محدودية الفرص الدراسية في بعض التخصصات',
    'قلة المساحات الخضراء',
    'قلة توافر بعض الأدوات الدراسية',
    'بطء في تحديث المناهج الدراسية',
    'قوة المنافسة بين الطلاب',
    'مشاكل في البنية التحتية في بعض الجامعات',
    'بعض الجامعات تحتاج لتحسين مستوى الخدمات الطلابية',
    'الضغوط النفسية بسبب كثافة المنهج',
    'قلة فرص العمل بعد التخرج في بعض التخصصات',
    'عدم توافر الأنشطة الطلابية الكافية',
    'ارتفاع تكلفة المعيشة في بعض المدن الجامعية',
    'المشاكل المتعلقة بالنقل والمواصلات',
    'التأخير في إعلان نتائج الامتحانات',
    'عدم تنوع الأنشطة الثقافية والترفيهية',
    'ضعف الربط بين الدراسة الأكاديمية وسوق العمل',
    'الفصول الدراسية مزدحمة',
    'مشاكل في التواصل بين الطلاب والأساتذة'
  ];

  final List<String> availableDisadvantagesEn = [
    'High tuition fees',
    'Crowding in some facilities',
    'Limited study opportunities in certain fields',
    'Lack of green spaces',
    'Limited availability of some study tools',
    'Slow curriculum updates',
    'High competition among students',
    'Infrastructure problems in some universities',
    'Some universities need improvement in student services',
    'Psychological pressure due to intensive curriculum',
    'Limited job opportunities after graduation in certain fields',
    'Insufficient student activities',
    'High cost of living in some university cities',
    'Transportation and commuting problems',
    'Delays in exam result announcements',
    'Lack of variety in cultural and recreational activities',
    'Weak connection between academic study and job market',
    'Overcrowded classrooms',
    'Communication issues between students and professors'
  ];

  final List<String> availableCitiesAr = [
    'القاهرة',
    'الإسكندرية',
    'الجيزة',
    'الشرقية',
    'الدقهلية',
    'قنا',
    'المنوفية',
    'سوهاج',
    'أسوان',
    'الفيوم',
    'البحر الأحمر',
    'كفر الشيخ',
    'المنيا',
    'الاسماعيلية',
    'بني سويف',
    'الغربية',
    'دمياط',
    'الوادي الجديد',
    'شمال سيناء',
    'جنوب سيناء',
    'السويس',
    'الأقصر',
    'بورسعيد',
    'حلوان',
    'مطروح',
    'شبين الكوم',
    'دمنهور',
    'أسيوط'
  ];

  final List<String> availableCitiesEn = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Sharqia',
    'Dakahlia',
    'Qena',
    'Menoufia',
    'Sohag',
    'Aswan',
    'Fayoum',
    'Red Sea',
    'Kafr El Sheikh',
    'Minya',
    'Ismailia',
    'Beni Suef',
    'Gharbia',
    'Damietta',
    'New Valley',
    'North Sinai',
    'South Sinai',
    'Suez',
    'Luxor',
    'Port Said',
    'Helwan',
    'Matrouh',
    'Shebin El Kom',
    'Damanhour',
    'Assiut'
  ];

  // For image upload
  Uint8List webImage = Uint8List(0);
  File? _imageFile;
  String? _imageURL;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (kIsWeb) {
        final Uint8List photo = await image.readAsBytes();
        setState(() => webImage = photo);
      } else {
        setState(() => _imageFile = File(image.path));
      }
    }
  }

  Future<void> _uploadImage() async {
    if (webImage.isNotEmpty || _imageFile != null) {
      try {
        String fileName = "${DateTime.now().millisecondsSinceEpoch}.png";
        Reference storageRef = _storage.ref().child('profile/$fileName');

        if (kIsWeb) {
          await storageRef.putData(
              webImage, SettableMetadata(contentType: "image/png"));
        } else {
          await storageRef.putFile(
              _imageFile!, SettableMetadata(contentType: "image/png"));
        }

        String downloadURL = await storageRef.getDownloadURL();
        setState(() => _imageURL = downloadURL);
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }

  void _addItemToList(
      String item, List<String> list, List<String> availableList) {
    setState(() {
      list.add(item);
      availableList.remove(item);
    });
  }

  void _removeItemFromList(
      String item, List<String> list, List<String> availableList) {
    setState(() {
      list.remove(item);
      availableList.add(item);
    });
  }

  Widget _buildDropdown(
      String label, List<String> list, List<String> availableList) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            // Dropdown
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey.shade300, width: 1.0),
                color: Colors.grey.shade100,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: DropdownButton<String>(
                isExpanded: true,
                underline: const SizedBox(), // Removes default underline
                hint: Text(
                  'Select $label',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                value: availableList.isEmpty ? null : availableList.first,
                items: availableList.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    _addItemToList(value, list, availableList);
                  }
                },
                icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 12),
            // Chips
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: list.map((item) {
                return Chip(
                  label: Text(
                    item,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                  deleteIcon: const Icon(Icons.close, color: Colors.white),
                  onDeleted: () {
                    _removeItemFromList(item, list, availableList);
                  },
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        isActive: _currentStep >= 0,
        title: Text('title'.tr()),
        content: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildTextField(
                  controller: idController,
                  label: 'university_id'.tr(),
                  prefixIcon: Icons.numbers,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: uinNameArController,
                        label: 'uni_name_ar'.tr(),
                        prefixIcon: Icons.school,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: uinNameEnController,
                        label: 'uni_name_en'.tr(),
                        prefixIcon: Icons.school_outlined,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: establishDateController,
                  label: 'uni_establish_date'.tr(),
                  prefixIcon: Icons.calendar_today,
                ),
                const SizedBox(height: 16),
                _buildDropdownField('uni_type'.tr(), uniType, selectedUniType,
                    (value) => setState(() => selectedUniType = value)),
              ],
            ),
          ),
        ),
      ),
      Step(
        isActive: _currentStep >= 1,
        title: Text('addCollege.statistics.title'.tr()),
        content: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: numberOfCollegesController,
                        label: 'uni_college_number'.tr(),
                        prefixIcon: Icons.account_balance,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: numberOfStudentsController,
                        label: 'uni_number_of_students'.tr(),
                        prefixIcon: Icons.people,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: numberOfTeachersController,
                  label: 'uni_number_of_teachers'.tr(),
                  prefixIcon: Icons.person,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: acceptedPercentageController,
                  label: 'uni_accepted_percentage'.tr(),
                  prefixIcon: Icons.percent,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ),
      ),
      Step(
        isActive: _currentStep >= 2,
        title: Text('addCollege.contact.title'.tr()),
        content: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: addressArController,
                        label: 'addCollege.contact.addressAr'.tr(),
                        prefixIcon: Icons.location_on,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: addressEnController,
                        label: 'addCollege.contact.addressEn'.tr(),
                        prefixIcon: Icons.location_on_outlined,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: contactNumberController,
                  label: 'addCollege.contact.contactNumber'.tr(),
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: emailController,
                  label: 'addCollege.contact.email'.tr(),
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: uniLinkController,
                  label: 'uni-website'.tr(),
                  prefixIcon: Icons.link,
                  keyboardType: TextInputType.url,
                ),
              ],
            ),
          ),
        ),
      ),
      Step(
        isActive: _currentStep >= 3,
        title: Text('addCollege.management.title'.tr()),
        content: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: universityPresidentArController,
                        label: 'uni_president_ar'.tr(),
                        prefixIcon: Icons.person_2,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: universityPresidentEnController,
                        label: 'uni_president_en'.tr(),
                        prefixIcon: Icons.person_2_outlined,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: studyingTypeController,
                  label: 'uni_studying_type'.tr(),
                  prefixIcon: Icons.school,
                ),
              ],
            ),
          ),
        ),
      ),
      Step(
        isActive: _currentStep >= 4,
        title: Text('addCollege.description.title'.tr()),
        content: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildTextField(
                  controller: descriptionArController,
                  label: 'addCollege.description.descriptionAr'.tr(),
                  prefixIcon: Icons.description,
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: descriptionEnController,
                  label: 'addCollege.description.descriptionEn'.tr(),
                  prefixIcon: Icons.description_outlined,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),
      Step(
        isActive: _currentStep >= 5,
        title: Text('addCollege.features.title'.tr()),
        content: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDropdown('addCollege.features.advantagesAr'.tr(),
                    advantagesAr, availableAdvantagesAr),
                const SizedBox(height: 16),
                _buildDropdown('addCollege.features.advantagesEn'.tr(),
                    advantagesEn, availableAdvantagesEn),
                const SizedBox(height: 16),
                _buildDropdown('addCollege.features.disadvantagesAr'.tr(),
                    disadvantagesAr, availableDisadvantagesAr),
                const SizedBox(height: 16),
                _buildDropdown('addCollege.features.disadvantagesEn'.tr(),
                    disadvantagesEn, availableDisadvantagesEn),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
      Step(
        isActive: _currentStep >= 6,
        title: Text('addCollege.locationAndImage.title'.tr()),
        content: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDropdown(
                    'allowed_city_ar'.tr(), allowCitiesAr, availableCitiesAr),
                const SizedBox(height: 16),
                _buildDropdown(
                    'allowed_city_en'.tr(), allowCitiesEn, availableCitiesEn),
                const SizedBox(height: 24),
                Center(
                  child: Column(
                    children: [
                      if (_imageURL != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            _imageURL!,
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _pickImage,
                            icon: const Icon(Icons.photo_library),
                            label: Text(
                                'addCollege.locationAndImage.pickImage'.tr()),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton.icon(
                            onPressed: _uploadImage,
                            icon: const Icon(Icons.upload),
                            label: Text(
                                'addCollege.locationAndImage.uploadImage'.tr()),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    int? maxLines,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }

  Widget _buildDropdownSection(
    String label,
    List<String> selectedList,
    List<String> availableList,
    IconData icon,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                hint: Text('Select $label'),
                value: null, // Set to null to avoid the duplicate value error
                items: availableList.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    _addItemToList(value, selectedList, availableList);
                  }
                },
              ),
              if (selectedList.isNotEmpty) const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: selectedList.map((item) {
                  return Chip(
                    label: Text(item),
                    deleteIcon: const Icon(Icons.close, size: 18),
                    onDeleted: () {
                      _removeItemFromList(item, selectedList, availableList);
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'add_uni'.tr(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            primary: Colors.blue,
          ),
        ),
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          onStepContinue: () {
            final isLastStep = _currentStep == getSteps().length - 1;
            if (isLastStep) {
              // Check if all controllers are not empty
              if (_imageURL != null &&
                  idController.text.isNotEmpty &&
                  uinNameArController.text.isNotEmpty &&
                  uinNameEnController.text.isNotEmpty &&
                  establishDateController.text.isNotEmpty &&
                  numberOfCollegesController.text.isNotEmpty &&
                  numberOfStudentsController.text.isNotEmpty &&
                  numberOfTeachersController.text.isNotEmpty &&
                  universityPresidentArController.text.isNotEmpty &&
                  universityPresidentEnController.text.isNotEmpty &&
                  addressArController.text.isNotEmpty &&
                  addressEnController.text.isNotEmpty &&
                  contactNumberController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  acceptedPercentageController.text.isNotEmpty &&
                  uniLinkController.text.isNotEmpty &&
                  descriptionArController.text.isNotEmpty &&
                  descriptionEnController.text.isNotEmpty &&
                  studyingTypeController.text.isNotEmpty &&
                  advantagesAr.isNotEmpty &&
                  advantagesEn.isNotEmpty &&
                  disadvantagesAr.isNotEmpty &&
                  disadvantagesEn.isNotEmpty &&
                  allowCitiesAr.isNotEmpty &&
                  allowCitiesEn.isNotEmpty) {
                // If all controllers have data, submit the data
                AddUinModel data = AddUinModel(
                    id: idController.text,
                    uinNameAr: uinNameArController.text,
                    uinNameEn: uinNameEnController.text,
                    establishDate: establishDateController.text,
                    numberOfColleges: numberOfCollegesController.text,
                    numberOfStudents: numberOfStudentsController.text,
                    numberOfTeachers: numberOfTeachersController.text,
                    universityPresidentAr: universityPresidentArController.text,
                    universityPresidentEn: universityPresidentEnController.text,
                    addressAr: addressArController.text,
                    addressEn: addressEnController.text,
                    contactNumber: contactNumberController.text,
                    email: emailController.text,
                    acceptedPercentage: acceptedPercentageController.text,
                    uniLink: uniLinkController.text,
                    descriptionAr: descriptionArController.text,
                    descriptionEn: descriptionEnController.text,
                    studyingType: studyingTypeController.text,
                    advantagesAr: advantagesAr,
                    advantagesEn: advantagesEn,
                    disadvantagesAr: disadvantagesAr,
                    disadvantagesEn: disadvantagesEn,
                    allowCitiesAr: allowCitiesAr,
                    allowCitiesEn: allowCitiesEn,
                    uniType: selectedUniType!,
                    image: _imageURL!,
                    filePrice: "200");
                AddUniBack.addUniData(data);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('University data submitted successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
                idController.clear();
                uinNameArController.clear();
                uinNameEnController.clear();
                establishDateController.clear();
                numberOfCollegesController.clear();
                numberOfStudentsController.clear();
                numberOfTeachersController.clear();
                universityPresidentArController.clear();
                universityPresidentEnController.clear();
                addressArController.clear();
                addressEnController.clear();
                contactNumberController.clear();
                emailController.clear();
                acceptedPercentageController.clear();
                uniLinkController.clear();
                descriptionArController.clear();
                descriptionEnController.clear();
                studyingTypeController.clear();
                advantagesAr.clear();
                advantagesEn.clear();
                disadvantagesAr.clear();
                disadvantagesEn.clear();
                allowCitiesAr.clear();
                allowCitiesEn.clear();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text('Please fill in all fields and upload an image.'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            } else {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepTapped: (step) => setState(() => _currentStep = step),
          steps: getSteps(),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> items,
      String? selectedValue, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        style: TextStyle(color: Colors.white, fontSize: 16),
        dropdownColor: Color(0xff03045E),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          // Define the border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
            borderSide: const BorderSide(
              color: Colors.black, // Border color
              width: 2.0, // Border width
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black, // Border color when enabled
              width: 2.0, // Border width
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black, // Border color when focused
              width: 2.0, // w width
            ),
          ),
        ),
        value: selectedValue,
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? 'Please select $label' : null,
      ),
    );
  }
}
