import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gam3ty/Screens/Add%20uin/model/add_uin_model.dart';
import 'package:gam3ty/Screens/add%20college/model/college_model.dart';
import 'package:gam3ty/backend/Add%20uni/add_uni_back.dart';
import 'package:gam3ty/backend/add%20college/add_college_back.dart';
import 'package:image_picker/image_picker.dart';

class AddCollegeScreen extends StatefulWidget {
  const AddCollegeScreen({super.key});

  @override
  State<AddCollegeScreen> createState() => _AddCollegeScreenState();
}

class _AddCollegeScreenState extends State<AddCollegeScreen> {
  int _currentStep = 0;

  // Controllers for text fields
  final TextEditingController idController = TextEditingController();
  final TextEditingController uinIdController = TextEditingController();
  final TextEditingController collegeNameArController = TextEditingController();
  final TextEditingController collegeNameEnController = TextEditingController();
  final TextEditingController establishDateController = TextEditingController();
  final TextEditingController numberOfAcademiesYearsController =
      TextEditingController();
  final TextEditingController TuitionFeesController = TextEditingController();
  // final TextEditingController numberOfTeachersController =
  //     TextEditingController();
  final TextEditingController collegePresidentArController =
      TextEditingController();
  final TextEditingController collegePresidentEnController =
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
  final List<String> careerOpportunitiesArList = [];
  final List<String> careerOpportunitiesEnList = [];
  final List<String> expectedJobsArList = [];
  final List<String> expectedJobsEnList = [];

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

  final List<String> availableCareerOpportunitiesAr = [
    'فرص عمل في كبرى الشركات العالمية',
    'تدريب عملي مدفوع الأجر',
    'إمكانية الحصول على شهادات مهنية معتمدة',
    'برامج تدريبية متخصصة',
    'فرص للبحث والتطوير في مختلف المجالات',
    'إمكانية العمل في مؤسسات حكومية ودولية',
    'فرص ريادة الأعمال وإنشاء المشاريع الخاصة',
    'شراكات مع شركات عالمية للتوظيف المباشر',
    'إمكانية العمل عن بعد مع شركات دولية',
    'فرص للتدريس في الجامعات والمعاهد',
    'دعم للخريجين في البحث عن وظائف',
    'فرص للانضمام إلى برامج الدراسات العليا',
    'شبكة علاقات مهنية واسعة مع أرباب العمل',
    'فرص تدريبية في مجالات تقنية متقدمة',
    'إمكانية تطوير المهارات القيادية والإدارية',
    'فرص للالتحاق ببرامج التبادل الوظيفي',
    'دعم لتأسيس الشركات الناشئة',
    'فرص عمل في قطاعات متعددة مثل التكنولوجيا، الطب، والهندسة',
    'برامج تأهيلية لسوق العمل',
    'فرص للتوظيف بدوام جزئي أثناء الدراسة'
  ];

  final List<String> availableCareerOpportunitiesEn = [
    'Job opportunities in top global companies',
    'Paid internships',
    'Possibility of obtaining certified professional qualifications',
    'Specialized training programs',
    'Opportunities for research and development in various fields',
    'Employment opportunities in government and international organizations',
    'Entrepreneurial opportunities and startup creation',
    'Partnerships with global companies for direct employment',
    'Remote work opportunities with international firms',
    'Teaching opportunities at universities and institutes',
    'Graduate support in job searching',
    'Opportunities to join postgraduate programs',
    'Extensive professional networking with employers',
    'Internship opportunities in advanced technology fields',
    'Opportunities to develop leadership and managerial skills',
    'Opportunities to participate in job exchange programs',
    'Support for establishing startups',
    'Job opportunities in multiple sectors such as technology, medicine, and engineering',
    'Career preparation programs',
    'Part-time job opportunities during studies'
  ];

  final List<String> expectedJobsAr = [
    'مهندس برمجيات',
    'طبيب',
    'محاسب',
    'محلل بيانات',
    'مستشار قانوني',
    'مدير مشاريع',
    'مطور ذكاء اصطناعي',
    'مدير تسويق رقمي',
    'أخصائي موارد بشرية',
    'مهندس ميكانيكي',
    'مهندس كهربائي',
    'محلل أعمال',
    'عالم بيانات',
    'مصمم جرافيك',
    'مطور تطبيقات الهاتف المحمول',
    'مهندس مدني',
    'مهندس معماري',
    'أخصائي أمن سيبراني',
    'كاتب محتوى',
    'مترجم',
    'طبيب أسنان',
    'صيدلي',
    'ممرض',
    'أخصائي تغذية',
    'مدير مالي',
    'خبير تجارة إلكترونية',
    'مدير سلسلة التوريد',
    'محلل استثمار',
    'مدرب تطوير شخصي',
    'خبير تحسين محركات البحث (SEO)',
    'مهندس ذكاء اصطناعي',
    'خبير تعلم آلي',
    'مخرج أفلام',
    'مدير إنتاج',
    'مصمم تجربة المستخدم (UX)',
    'مصمم واجهة المستخدم (UI)',
    'مهندس صوت',
    'مهندس طيران',
    'مدير علاقات عامة',
    'أخصائي شبكات',
    'محلل نظم معلومات',
    'خبير بيئي',
    'باحث علمي',
    'مدير مشتريات',
    'مصور فوتوغرافي',
    'مدير تطوير الأعمال',
    'صحفي',
    'مدرب رياضي',
    'أخصائي نفسي',
    'مدرس لغات',
    'فني مختبر طبي',
    'خبير أمن معلومات',
    'مطور بلوك تشين',
    'خبير تجارة دولية',
    'مستشار تعليمي',
    'طيار',
    'خبير لوجستيات'
  ];

  final List<String> expectedJobsEn = [
    'Software Engineer',
    'Doctor',
    'Accountant',
    'Data Analyst',
    'Legal Consultant',
    'Project Manager',
    'AI Developer',
    'Digital Marketing Manager',
    'HR Specialist',
    'Mechanical Engineer',
    'Electrical Engineer',
    'Business Analyst',
    'Data Scientist',
    'Graphic Designer',
    'Mobile App Developer',
    'Civil Engineer',
    'Architect',
    'Cybersecurity Specialist',
    'Content Writer',
    'Translator',
    'Dentist',
    'Pharmacist',
    'Nurse',
    'Nutritionist',
    'Financial Manager',
    'E-commerce Specialist',
    'Supply Chain Manager',
    'Investment Analyst',
    'Personal Development Coach',
    'SEO Specialist',
    'AI Engineer',
    'Machine Learning Expert',
    'Film Director',
    'Production Manager',
    'UX Designer',
    'UI Designer',
    'Sound Engineer',
    'Aerospace Engineer',
    'Public Relations Manager',
    'Network Specialist',
    'Information Systems Analyst',
    'Environmental Scientist',
    'Research Scientist',
    'Procurement Manager',
    'Photographer',
    'Business Development Manager',
    'Journalist',
    'Sports Coach',
    'Psychologist',
    'Language Teacher',
    'Medical Laboratory Technician',
    'Information Security Expert',
    'Blockchain Developer',
    'International Trade Specialist',
    'Educational Consultant',
    'Pilot',
    'Logistics Specialist'
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
        title: const Text('Basic Info'),
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
                        controller: uinIdController,
                        label: 'University ID',
                        prefixIcon: Icons.numbers,
                      ),
                    ),
                    Expanded(
                      child: _buildTextField(
                        controller: idController,
                        label: 'College ID',
                        prefixIcon: Icons.numbers,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: collegeNameArController,
                        label: 'College Name (AR)',
                        prefixIcon: Icons.school,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: collegeNameEnController,
                        label: 'College Name (EN)',
                        prefixIcon: Icons.school_outlined,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: establishDateController,
                  label: 'Establish Date',
                  prefixIcon: Icons.calendar_today,
                ),
              ],
            ),
          ),
        ),
      ),
      Step(
        isActive: _currentStep >= 1,
        title: const Text('Statistics'),
        content: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                _buildTextField(
                  controller: TuitionFeesController,
                  label: 'Tuition fees',
                  prefixIcon: Icons.person,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: acceptedPercentageController,
                  label: 'Accepted Percentage',
                  prefixIcon: Icons.percent,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: numberOfAcademiesYearsController,
                  label: 'Number of Academic years',
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
        title: const Text('Contact'),
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
                        label: 'Address (AR)',
                        prefixIcon: Icons.location_on,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: addressEnController,
                        label: 'Address (EN)',
                        prefixIcon: Icons.location_on_outlined,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: contactNumberController,
                  label: 'Contact Number',
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: emailController,
                  label: 'Email',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: uniLinkController,
                  label: 'College Website',
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
        title: const Text('Management'),
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
                        controller: collegePresidentArController,
                        label: 'College President (AR)',
                        prefixIcon: Icons.person_2,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: collegePresidentEnController,
                        label: 'College President (EN)',
                        prefixIcon: Icons.person_2_outlined,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: studyingTypeController,
                  label: 'Studying Type',
                  prefixIcon: Icons.school,
                ),
              ],
            ),
          ),
        ),
      ),
      Step(
        isActive: _currentStep >= 4,
        title: const Text('Description'),
        content: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildTextField(
                  controller: descriptionArController,
                  label: 'Description (AR)',
                  prefixIcon: Icons.description,
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: descriptionEnController,
                  label: 'Description (EN)',
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
        title: const Text('Features'),
        content: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDropdown(
                    'Advantages (AR)', advantagesAr, availableAdvantagesAr),
                const SizedBox(height: 16),
                _buildDropdown(
                    'Advantages (EN)', advantagesEn, availableAdvantagesEn),
                const SizedBox(height: 16),
                _buildDropdown('Disadvantages (AR)', disadvantagesAr,
                    availableDisadvantagesAr),
                const SizedBox(height: 16),
                _buildDropdown('Disadvantages (EN)', disadvantagesEn,
                    availableDisadvantagesEn),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
      Step(
        isActive: _currentStep >= 6,
        title: const Text('Location & Image'),
        content: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDropdown('Career Opportunities (AR)',
                    careerOpportunitiesArList, availableCareerOpportunitiesAr),
                const SizedBox(height: 16),
                _buildDropdown('Career Opportunities (EN)',
                    careerOpportunitiesEnList, availableCareerOpportunitiesEn),
                const SizedBox(height: 24),
                _buildDropdown(
                    'Expected Jobs (AR)', expectedJobsArList, expectedJobsAr),
                const SizedBox(height: 16),
                _buildDropdown(
                    'Expected Jobs (EN)', expectedJobsEnList, expectedJobsEn),
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
                            label: const Text('Pick Image'),
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
                            label: const Text('Upload Image'),
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
        title: const Text(
          'Add College',
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
                  collegeNameArController.text.isNotEmpty &&
                  collegeNameEnController.text.isNotEmpty &&
                  establishDateController.text.isNotEmpty &&
                  uinIdController.text.isNotEmpty &&
                  TuitionFeesController.text.isNotEmpty &&
                  collegePresidentArController.text.isNotEmpty &&
                  collegePresidentEnController.text.isNotEmpty &&
                  addressArController.text.isNotEmpty &&
                  addressEnController.text.isNotEmpty &&
                  contactNumberController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  acceptedPercentageController.text.isNotEmpty &&
                  uniLinkController.text.isNotEmpty &&
                  descriptionArController.text.isNotEmpty &&
                  descriptionEnController.text.isNotEmpty &&
                  studyingTypeController.text.isNotEmpty &&
                  numberOfAcademiesYearsController.text.isNotEmpty &&
                  advantagesAr.isNotEmpty &&
                  advantagesEn.isNotEmpty &&
                  disadvantagesAr.isNotEmpty &&
                  disadvantagesEn.isNotEmpty &&
                  careerOpportunitiesArList.isNotEmpty &&
                  careerOpportunitiesEnList.isNotEmpty &&
                  expectedJobsArList.isNotEmpty &&
                  expectedJobsEnList.isNotEmpty) {
                // If all controllers have data, submit the data
                CollegeModel data = CollegeModel(
                  id: idController.text,
                  uinId: uinIdController.text,
                  nameAr: collegeNameArController.text,
                  nameEn: collegeNameEnController.text,
                  establishDate: establishDateController.text,
                  Tuitionfees: TuitionFeesController.text,
                  collegePresidentAr: collegePresidentArController.text,
                  collegePresidentEn: collegePresidentEnController.text,
                  addressAr: addressArController.text,
                  addressEn: addressEnController.text,
                  contactNumber: contactNumberController.text,
                  email: emailController.text,
                  acceptedPercentage: acceptedPercentageController.text,
                  uniLink: uniLinkController.text,
                  descriptionAr: descriptionArController.text,
                  descriptionEn: descriptionEnController.text,
                  studyingType: studyingTypeController.text,
                  academicYear: numberOfAcademiesYearsController.text,
                  advantagesAr: advantagesAr,
                  advantagesEn: advantagesEn,
                  disadvantagesAr: disadvantagesAr,
                  disadvantagesEn: disadvantagesEn,
                  careerOpportunitiesArList: careerOpportunitiesArList,
                  careerOpportunitiesEnList: careerOpportunitiesEnList,
                  expectedJobsAr: expectedJobsArList,
                  expectedJobsEn: expectedJobsEnList,
                  image: _imageURL!,
                );
                AddCollegeBack.addCollegeData(data);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('University data submitted successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
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
}
