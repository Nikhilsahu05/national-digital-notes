import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/constants/my_colors.dart';
import '../detailed_coaching_screen/detailed_coaching_view.dart';
import '../subject_books/subject_wise_view.dart';

class TabsSimpleLightRoute extends StatefulWidget {
  String title;

  TabsSimpleLightRoute({super.key, required this.title});

  @override
  TabsSimpleLightRouteState createState() => TabsSimpleLightRouteState();
}

class TabsSimpleLightRouteState extends State<TabsSimpleLightRoute>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController? _scrollController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScroller) {
            return <Widget>[
              SliverAppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.dark),
                pinned: true,
                floating: true,
                backgroundColor: MyColors.primary,
                forceElevated: innerBoxIsScroller,
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                title: Text(widget.title),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {},
                  ),
                  // overflow menu
                ],
                bottom: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.white,
                  isScrollable: true,
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey.shade400,
                  tabs: const [
                    SizedBox(
                      width: 70,
                      child: Tab(text: "Coaching"),
                    ),
                    SizedBox(
                      width: 70,
                      child: Tab(text: "Books"),
                    ),
                    SizedBox(
                      width: 70,
                      child: Tab(text: "Overview"),
                    ),
                    SizedBox(
                      width: 70,
                      child: Tab(text: "Syllabus"),
                    ),
                    SizedBox(
                      width: 90,
                      child: Tab(text: "Exam Date"),
                    ),
                  ],
                  controller: _tabController,
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              const DetailedCoursesTab(),
              SubjectWiseView(
                isHome: false,
                coachingName: '',
                examType: '',
                subjectName: '',
              ),
              widget.title == "UPSC"
                  ? Container(
                      color: Colors.blue.shade50,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                        child: Text("What is UPSC?\n"
                            "\n"
                            'UPSC is India’s central agency which conducts exams like Civil Services Exam (CSE) to recruit candidates into top government services like IAS, IPS, IFS etc. UPSC recruits candidates to both civil services as well as defence services.\n'
                            "\n"
                            'What is the full form of UPSC?'
                            "\n"
                            'The full form of UPSC is Union Public Service Commission.'
                            "\n"
                            'What are the exams conducted by UPSC for selection into civil services?'
                            "\n"
                            '1. Civil Services Examination (CSE)'
                            "\n"
                            '2. Engineering Services Examination (ESE).'
                            "\n"
                            '3. Indian Forestry Services Examination (IFoS).'
                            "\n"
                            '4. Central Armed Police Forces Examination (CAPF).'
                            "\n"
                            '5. Indian Economic Service and Indian Statistical Service (IES/ISS).'
                            "\n"
                            '6. Combined Geo-Scientist and Geologist Examination.'
                            "\n"
                            '7. Combined Medical Services (CMS).'
                            "\n"
                            '8. Special Class Railway Apprentices Exam (SCRA).'
                            "\n"
                            '9. Limited Departmental Competitive Examination for selection of Assistant Commandant. (Executive) in CISF.'
                            "\n\n"
                            'What are the exams conducted by UPSC for selection into defence services?'
                            "\n\n"
                            '1. National Defence Academy & Naval Academy Examination – NDA & NA (I).'
                            "\n"
                            '2. National Defence Academy & Naval Academy Examination – NDA & NA (II).'
                            "\n"
                            '3. Combined Defense Services Exam – CDS (I).'
                            "\n"
                            '4. Combined Defense Services Exam – CDS (II).'
                            "\n\n"
                            ' UPSC Exam: What is the UPSC Civil Services Examination?'
                            ' Civil Services Examination (CSE) is one of the most popular exams conducted by the Union Public Service Commission. It is widely known as the ‘IAS exam’ even though CSE is a common exam to recruit candidates to about 24 top government services like IAS, IPS, IFS, IRS etc.'
                            "\n\n"
                            ' UPSC Civil Services Exam (CSE) consists of 3 stages. The stages are:'
                            '1. Preliminary Exam (objective)'
                            '2. Main Exam (written)'
                            '3. Interview (personality test)'
                            '  The exam window extends around 10-12 months (usually from June month of a year to June month next year when the results are announced).'
                            "\n\n"
                            ' How to prepare for UPSC CSE?'
                            "\n\n"
                            ' Proper training and practice can significantly increase the chance of success of candidates in the UPSC Civil Services Examination.'
                            ' In this age of the internet, you can clear the IAS exam by online preparation.'
                            "\n\n"
                            'Please find the 7-steps we recommend for aspirants to succeed in the UPSC Services Examination.'
                            "\n\n"
                            ' * Step 1: Join ClearIAS Online Classroom Program (ClearIAS Classes)'
                            '* Step 2: Prepare Notes based on ClearIAS Classes'
                            '* Step 3: Self-Study (Learn ClearIAS Notes, NCERT Textbooks and Standard Textbooks)'
                            '   * Step 4: Take ClearIAS Prelims Online Mock Exams'
                            '  * Step 5: Take ClearIAS Mains Mock Exams. Polish your answer writing skills'
                            ' * Step 6: Learn Optional Subject'
                            '  * Step 7: Participate in ClearIAS Interview Program'
                            '  Note: Once you join ClearIAS Online Classroom Program (ClearIAS Classes) you will get detailed guidance and personal mentorship regarding all stages of UPSC preparation.'),
                      ),
                    )
                  : Container(),
              widget.title == "UPSC"
                  ? Container(
                      color: Colors.blue.shade50,
                      padding: const EdgeInsets.all(10),
                      child: const Text("Syllabus"
                          "\n\n"
                          "Comparison of the Indian constitutional scheme with that of other countries"
                          "\n\n"
                          "Parliament and State Legislatures – structure, functioning, the conduct of business,"
                          "powers & privileges and issues arising out of these."
                          "Structure, organization and functioning of the Executive and the Judiciary Ministries and Departments of the Government; pressure groups and formal/informal associations and their role in the Polity."
                          "\n\n"
                          "         Salient features of the Representation of People’s Act."
                          "Appointment to various Constitutional posts, powers, functions and responsibilities of various Constitutional Bodies."
                          "\n\n"
                          "         Statutory, regulatory and various quasi-judicial bodies."
                          "Government policies and interventions for development in various sectors and issues arising out of their design and implementation."
                          "\n\n"
                          "Development processes and the development industry- the role of NGOs, SHGs, various groups and associations, donors, charities, institutional and other stakeholders."
                          "\n\n"
                          "Welfare schemes for vulnerable sections of the population by the Centre and States and the performance of these schemes; mechanisms, laws, institutions and Bodies constituted for the protection and betterment of these vulnerable sections."
                          "Issues relating to the development and management of Social Sector/Services relating to Health, Education, Human Resources."
                          "Issues relating to poverty and hunger."
                          "\n\n"
                          "Important aspects of governance, transparency and accountability, e-governance- applications, models, successes, limitations, and potential; citizens charters, transparency & accountability and institutional and other measures."
                          "Role of civil services in a democracy."
                          "India and its neighbourhood- relations."
                          "\n\n"
                          "Bilateral, regional and global groupings and agreements involving India and/or affecting India’s interests."
                          "Effect of policies and politics of developed and developing countries on India’s interests, Indian Diaspora."
                          "Important International institutions, agencies and fora- their structure, mandate."
                          "4. Paper‐4: (General Studies 3) – 250 Marks"
                          "General Studies 3 Paper Syllabus for UPSC Civil Services Mains Exam consists of the below major areas: Technology, Economic Development, Biodiversity, Environment, Security and Disaster Management. Detailed syllabus as provided by UPSC is as below:"
                          "General Studies 3 Paper Syllabus for UPSC Civil Services Mains"
                          "Indian Economy and issues relating to planning, mobilization of resources, growth, development and employment."
                          "Inclusive growth and issues arising from it."
                          "Government Budgeting."
                          "Major crops cropping patterns in various parts of the country, different types of irrigation and irrigation systems storage, transport and marketing of agricultural produce and issues and related constraints; e-technology in the aid of farmers."
                          "Issues related to direct and indirect farm subsidies and minimum support prices; Public Distribution System- objectives, functioning, limitations, revamping; issues of buffer stocks and food security; Technology missions; economics of animal-rearing."
                          "Food processing and related industries in India- scope and significance, location, upstream and downstream requirements, supply chain management."
                          "Land reforms in India."
                          "Effects of liberalization on the economy, changes in industrial policy and their effects on"
                          "industrial growth."
                          "Infrastructure: Energy, Ports, Roads, Airports, Railways etc."
                          "Investment models."
                          "Science and Technology- developments and their applications and effects in everyday life."
                          "Achievements of Indians in science & technology; indigenization of technology and developing new technology."
                          "Awareness in the fields of IT, Space, Computers, robotics, nanotechnology, biotechnology and issues"
                          "relating to intellectual property rights."
                          "Conservation, environmental pollution and degradation, environmental impact assessment."
                          "Disaster and disaster management."
                          "Linkages between development and spread of extremism."
                          "Role of external state and non-state actors in creating challenges to internal security."
                          "Challenges to internal security through communication networks, the role of media and social networking sites in internal security challenges, basics of cyber security; money-laundering and its prevention."
                          "Security challenges and their management in border areas; linkages of organized crime with terrorism."
                          "Various Security forces and agencies and their mandate."
                          "5. Paper‐5: (General Studies 4) – 250 Marks"
                          "General Studies 4 Paper Syllabus for UPSC Civil Services Mains Exam consists of the below major areas: Ethics, Integrity, and Aptitude. Details of the syllabus as provided by UPSC is as below: This paper will include questions to test the candidates’ attitude and approach to issues relating to integrity, probity in public life and his problem-solving approach to various issues and conflicts faced by him in dealing with society. Questions may utilise the case study approach to determine these aspects. The following broad areas will be covered:"
                          "General Studies 4 Paper Syllabus for UPSC Civil Services Mains"
                          "Ethics and Human Interface: Essence, determinants and consequences of Ethics in human actions; dimensions of ethics; ethics in private and public relationships. Human Values – lessons from the lives and teachings of great leaders, reformers and administrators; role of family, society and educational institutions in inculcating values."
                          "Attitude: content, structure, function; its influence and relation with thought and behaviour; moral and political attitudes; social influence and persuasion."
                          "Aptitude and foundational values for Civil Service, integrity, impartiality and non-partisanship, objectivity, dedication to public service, empathy, tolerance and compassion towards the weaker sections."
                          "Emotional intelligence-concepts, and their utilities and application in administration and governance."
                          "Contributions of moral thinkers and philosophers from India and the world."
                          "Public/Civil service values and Ethics in Public administration: Status and problems; ethical concerns and dilemmas in government and private institutions; laws, rules, regulations and conscience as sources of ethical guidance; accountability and ethical governance; strengthening of ethical and moral values in governance; ethical issues in international relations and funding; corporate governance."
                          "Probity in Governance: Concept of public service; Philosophical basis of governance and probity; Information sharing and transparency in government, Right to Information, Codes of Ethics, Codes of Conduct, Citizen’s Charters, Work culture, Quality of service delivery, Utilization of public funds, challenges of corruption."
                          "Case Studies on the above issues."
                          "6. Paper‐6: (Optional Subject Paper 1) – 250 Marks"
                          " 7. Paper‐7: (Optional Subject Paper 2) – 250 Marks"
                          ""
                          ""),
                    )
                  : Container(),
              Image.asset(
                'assets/upsc-exam-timetable-1.jpg',
              ),
            ],
          )),
    );
  }
}

class DetailedCoursesTab extends StatefulWidget {
  const DetailedCoursesTab({Key? key}) : super(key: key);

  @override
  State<DetailedCoursesTab> createState() => _DetailedCoursesTabState();
}

class _DetailedCoursesTabState extends State<DetailedCoursesTab> {
  bool isGridView = true;

  Map coursesNames = {
    'name': [
      'Sharma Academy',
      'Atharva IAS Academy',
      'PS Academy',
      'Tathagat IAS',
      'Drishtikon',
      'Kothari Institute',
    ],
    'image_url': [
      'assets/coaching_logos/sharma_academy.png',
      'assets/coaching_logos/atharv_ias_academy.png',
      'assets/coaching_logos/ps_academy.png',
      'assets/coaching_logos/thathaga_ias.jpg',
      'assets/coaching_logos/drishtikon.png',
      'assets/coaching_logos/kothari-logo.png',
    ],
    'desc': [
      'Sharma Academy is Perfect Coaching',
      'Atharv-IAS is designed to be your companion',
      'PS Academy want to create successfull',
      'Tathagat IAS is one of the Best IAS Coaching ',
      'Drishtikon Ias Coaching best for IAS',
      '40 years ago, a well-known educationalist',
    ],
  };

  final List<IconData> iconData = <IconData>[
    Icons.book,
    Icons.school,
    Icons.ac_unit_rounded,
    Icons.access_alarm_outlined,
    Icons.class_,
    Icons.book,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "COACHING",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        letterSpacing: 1.05,
                        fontWeight: FontWeight.w600),
                  ),
                  isGridView == true
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isGridView = !isGridView;
                            });
                          },
                          icon: const Icon(
                            Icons.grid_view_rounded,
                            size: 20,
                          ))
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              isGridView = !isGridView;
                            });
                          },
                          icon: const Icon(Icons.list, size: 20))
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  primary: true,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(0),
                  gridDelegate: isGridView == false
                      ? const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, childAspectRatio: 3)
                      : const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.7,
                          crossAxisSpacing: 2),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.to(DetailedCoachingView(
                          index: index,
                          map: coursesNames,
                          courseName: coursesNames['name'][index],
                        ));
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isGridView == true
                              ? Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 10),
                                    color: Colors.transparent,
                                    alignment: Alignment.bottomRight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10,
                                                  top: 10,
                                                  bottom: 10),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                coursesNames['name'][index]
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ),
                                        Flexible(
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, top: 0, bottom: 10),
                                              child: Image.asset(
                                                  '${coursesNames['image_url'][index]}')),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : listTile(
                                  index,
                                  '${coursesNames['name'][index]}',
                                  "${coursesNames['desc'][index]}",
                                  '${coursesNames['image_url'][index]}')),
                    );
                  }),
            )
          ]),
    );
  }
}

Widget listTile(int index, String title, String desc, String imageURL) {
  return Card(
    elevation: 5,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.trimLeft(),
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 150,
                child: Text(
                  desc.trimLeft(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(
              imageURL,
              fit: BoxFit.fitWidth,
            )),
      ],
    ),
  );
}
