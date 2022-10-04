import 'dart:developer';
import 'dart:math' as math;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_digital_notes/views/about_screen/about_us_view.dart';
import 'package:national_digital_notes/views/login_screen/login_view.dart';
import 'package:national_digital_notes/views/sucess_story_screens/success_story_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants/heading_text_styles.dart';
import '../../utils/constants/my_colors.dart';
import '../detailed_course_screen/detailed_course_view.dart';
import '../my_library_screen/my_library_screen.dart';
import '../privaceAndTerms_screens.dart';
import '../profile_settings_screen/profile_settings_views.dart';
import 'controller_dashboard_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 3) {
      _scaffoldKey.currentState?.openDrawer();
      _selectedIndex = 0;
      index = 0;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  DashboardController dashboardController = Get.put(DashboardController());

  Map coursesNames = {
    'name': [
      'UPSC',
      'Banking',
      'SI',
      'PSC',
      'Defence & Police',
      'SSC',
      'NDA',
      'CDS II 2023',
      'Civil Services',
      'Railway',
      'Indian Navy',
      'JSSC'
    ],
    'desc': [
      'SBI,IBPS,LIC & Other BanksExams.',
      'Prelims and Mains',
      'Sanitary Inspectors',
      'Public Service Commission',
      'National Defence Academy',
      'Union Public Service Commission',
      'Civil Service Aptitude or CSAT',
      'Railways (Railway Board)',
      'Indian Navy is a dimensional force',
      'Notice Regarding Extension',
      'THE INDIAN NAVY',
      'Jharkhand Staff Selection Commission'
    ],
  };

  final List<IconData> iconData = <IconData>[
    Icons.book,
    Icons.school,
    Icons.ac_unit_rounded,
    Icons.access_alarm_outlined,
    Icons.class_,
    Icons.book,
    Icons.school,
    Icons.ac_unit_rounded,
    Icons.access_alarm_outlined,
    Icons.class_,
    Icons.confirmation_num_sharp,
    Icons.confirmation_num_sharp,
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Get.to(SettingProfileRoute());
                },
                child: SizedBox(
                  height: 190,
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/home_screen_images/material_bg_1.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 14),
                        child: CircleAvatar(
                          radius: 36,
                          backgroundColor: Colors.grey[100],
                          child: const CircleAvatar(
                            radius: 33,
                            backgroundImage: AssetImage(
                                'assets/home_screen_images/Screenshot 2022-09-29 153032.png'),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 18),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Tanmay Sasvadkar",
                                  style: MyText.body2(context)!.copyWith(
                                      color: Colors.grey[100],
                                      fontWeight: FontWeight.bold)),
                              Container(height: 5),
                              Text("tanmay@immersiveinfotech.com",
                                  style: MyText.body2(context)!
                                      .copyWith(color: Colors.grey[100]))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text("My Orders",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading: const Icon(Icons.subscriptions,
                    size: 25.0, color: Colors.grey),
                onTap: () {
                  Get.to(const MyLibraryView());
                  // onDrawerItemClicked("Home");
                },
              ),

              ListTile(
                title: Text("Free eBooks",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading: const Icon(Icons.menu_book_sharp,
                    size: 25.0, color: Colors.grey),
                onTap: () {
                  // onDrawerItemClicked("Latest");
                },
              ),
              const Divider(
                height: 1,
                thickness: 1.4,
              ),
              ListTile(
                title: Text("Saved Notes",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading: const Icon(Icons.note_sharp,
                    size: 25.0, color: Colors.grey),
                onTap: () {
                  // onDrawerItemClicked("Highlight");
                },
              ),
              // ListTile(
              //   title: Text("Current Affairs",
              //       style: MyText.subhead(context)!.copyWith(
              //           color: Colors.black, fontWeight: FontWeight.w500)),
              //   leading:
              //       const Icon(Icons.newspaper, size: 25.0, color: Colors.grey),
              //   onTap: () {
              //     // onDrawerItemClicked("Settings");
              //   },
              // ),
              ListTile(
                title: Text("Success Stories",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading: const Icon(Icons.auto_stories,
                    size: 25.0, color: Colors.grey),
                onTap: () {
                  Get.to(SuccessStory());
                },
              ),
              const Divider(
                height: 1,
                thickness: 1.4,
              ),
              ListTile(
                title: Text("Share",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading:
                    const Icon(Icons.share, size: 25.0, color: Colors.grey),
                onTap: () {
                  Share.text(
                    'NATIONAL DIGITAL NOTES',
                    'NDN',
                    'www.google.com',
                  );
                  // onDrawerItemClicked("Help");
                },
              ),
              const Divider(
                height: 1,
                thickness: 1.4,
              ),
              ListTile(
                title: Text("Contact us",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading:
                    const Icon(Icons.phone, size: 25.0, color: Colors.grey),
                onTap: () {
                  showDialog(
                      context: context, builder: (_) => CustomEventDialog());
                  // onDrawerItemClicked("Help");
                },
              ),
              const Divider(
                height: 1,
                thickness: 1.4,
              ),
              ListTile(
                title: Text("About NDN",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading: const Icon(Icons.info, size: 25.0, color: Colors.grey),
                onTap: () {
                  Get.to(const AboutAppSimpleBlueRoute());
                  // onDrawerItemClicked("Help");
                },
              ),
              const Divider(
                height: 1,
                thickness: 1.4,
              ),
              ListTile(
                title: Text("Terms",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading: const Icon(Icons.front_hand_sharp,
                    size: 25.0, color: Colors.grey),
                onTap: () {
                  Get.to(const TermsScreen());
                  // onDrawerItemClicked("Help");
                },
              ),
              ListTile(
                title: Text("Polices",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading:
                    const Icon(Icons.policy, size: 25.0, color: Colors.grey),
                onTap: () {
                  Get.to(const PoliciesScreen());

                  // onDrawerItemClicked("Help");
                },
              ),
              ListTile(
                title: Text("Logout",
                    style: MyText.subhead(context)!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading: const Icon(Icons.help_outline,
                    size: 25.0, color: Colors.grey),
                onTap: () {
                  Get.offAll(const LoginView());
                },
              ),
            ],
          ),
        ),
      ),
      key: _scaffoldKey,
      backgroundColor: Colors.blue.shade50,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books_rounded,
            ),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
            ),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
            ),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
            log("Tapped on Drawer");
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Dashboard",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(SettingProfileRoute());
                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                height: 150,
                viewportFraction: 0.99,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                'assets/home_screen_images/BANNER01 (13).png',
                'assets/home_screen_images/BANNER02 (3).png',
                'assets/home_screen_images/BANNER03.jpg',
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(i));
                  },
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "EXAMS CATEGORIES",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    letterSpacing: 1.05,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  primary: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 2,
                      crossAxisCount: 2,
                      childAspectRatio: 1.7),
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        dashboardController.examCategories.value =
                            coursesNames['name'][index].toString();
                        if (kDebugMode) {
                          print(coursesNames['name'][index].toString());
                        }
                        // dashboardController.examCategories.value =
                        //     coursesNames['name'][index].toString();
                        // log('Card title :: ${coursesNames[index]} , Icon :: ${iconData[index]}');

                        Get.to(TabsSimpleLightRoute(
                          title: coursesNames['name'][index].toString(),
                        ));
                        log(dashboardController.examCategories.value);
                      },
                      child: Card(
                        elevation: 3,
                        color: Colors.white,
                        child: Container(
                          padding: const EdgeInsets.only(right: 10),
                          color: Colors.transparent,
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 10, bottom: 0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    coursesNames['name'][index].toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                height: 2,
                                thickness: 1.3,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    child: Text(
                                      coursesNames['desc'][index].toString(),
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color((math.Random()
                                                            .nextDouble() *
                                                        0xFFFFFF)
                                                    .toInt())
                                                .withOpacity(0.4)),
                                        width: 40,
                                        height: 40,
                                        child: Icon(iconData[index])),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ]),
    );
  }
}

class CustomEventDialog extends StatefulWidget {
  CustomEventDialog({Key? key}) : super(key: key);

  @override
  CustomEventDialogState createState() => new CustomEventDialogState();
}

class CustomEventDialogState extends State<CustomEventDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 160,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Wrap(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.lightGreen[400],
                child: Column(
                  children: <Widget>[
                    Container(height: 10),
                    Icon(Icons.call, color: Colors.white, size: 80),
                    Container(height: 10),
                    Text("Contact us",
                        style: MyText.title(context)!
                            .copyWith(color: Colors.white)),
                    Container(height: 10),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text('+91 6989898123',
                        textAlign: TextAlign.center,
                        style: MyText.subhead(context)!
                            .copyWith(color: MyColors.grey_60)),
                    Container(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreen[500],
                        elevation: 0,
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0)),
                      ),
                      child: Text("Call Now",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        launch("tel://+91 6989898123");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
