import 'dart:developer';
import 'dart:math' as math;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      'Indian Navy is a balanced three dimensional',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_rounded),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
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
                  onPressed: () {},
                  icon: Icon(
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
                    color: Colors.grey,
                    fontSize: 14,
                    letterSpacing: 1.05,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
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
                        log('Card title :: ${coursesNames[index]} , Icon :: ${iconData[index]}');
                      },
                      child: Card(
                        elevation: 3,
                        color: Colors.white,
                        child: Container(
                          padding: EdgeInsets.only(right: 10),
                          color: Colors.transparent,
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 10, bottom: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    coursesNames['name'][index].toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    child: Text(
                                      coursesNames['desc'][index].toString(),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 11),
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
