import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:national_digital_notes/views/dashboard_screen/controller_dashboard_view.dart';

import '../subject_books/subject_wise_view.dart';

class DetailedCoachingView extends StatefulWidget {
  int index;
  Map map;
  String courseName;

  DetailedCoachingView(
      {required this.index, required this.map, required this.courseName});

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
    print(dashboardController.examCategories.value);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.map['name'][widget.index],
                style: TextStyle(fontSize: 14),
              ),
              Text(
                dashboardController.examCategories.value,
                style: TextStyle(fontSize: 12, color: Colors.white70),
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
            SizedBox(
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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "SUBJECTS",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
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
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.to(SubjectWiseView(
                          coachingName: '${widget.map['name'][widget.index]}',
                          examType:
                              '${dashboardController.examCategories.value}',
                          subjectName:
                              '${coursesNames['name'][index].toString()}',
                        ));
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
