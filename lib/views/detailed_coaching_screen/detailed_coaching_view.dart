import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_digital_notes/views/dashboard_screen/controller_dashboard_view.dart';

import '../subject_books/subject_wise_view.dart';

class DetailedCoachingView extends StatefulWidget {
  int index;
  Map map;
  String courseName;

  DetailedCoachingView(
      {super.key,
      required this.index,
      required this.map,
      required this.courseName});

  @override
  State<DetailedCoachingView> createState() => _DetailedCoachingViewState();
}

class _DetailedCoachingViewState extends State<DetailedCoachingView> {
  Map coursesNames = {
    'name': [
      'Chemistry',
      'Physics',
      'Maths',
      'English',
      'Biology',
    ],
    'desc': [
      'SBI,IBPS,',
      'Prelims and Mains',
      'Sanitary Inspectors',
      'Public Service Commission',
      'National Defence Academy',
    ],
  };

  final imagesURL = [
    'assets/subjects_logo/pngwing.com.png',
    'assets/subjects_logo/pngwing.com (1).png',
    'assets/subjects_logo/pngwing.com (2).png',
    'assets/subjects_logo/pngwing.com (3).png',
    'assets/subjects_logo/pngwing.com (4).png',
  ];
  DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    log(dashboardController.examCategories.value);
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.map['name'][widget.index],
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                dashboardController.examCategories.value,
                style: const TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
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
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
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
                'assets/coaching_banners/mppsc-coaching-in-indore-harshal-topper.png',
                'assets/coaching_banners/scholarship.png',
                'assets/coaching_banners/sharmaacademy2.png',
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width * 0.99,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(
                          i,
                          fit: BoxFit.fill,
                        ));
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "SUBJECTS",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
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
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.to(SubjectWiseView(
                          isHome: true,
                          coachingName: '${widget.map['name'][widget.index]}',
                          examType: dashboardController.examCategories.value,
                          subjectName: coursesNames['name'][index].toString(),
                        ));
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
                              const Divider(
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
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(imagesURL[index])),
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
          ],
        ),
      ),
    );
  }
}
