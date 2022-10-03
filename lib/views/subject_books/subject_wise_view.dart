import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../specific_book_details_screen/specific_books_views.dart';

class SubjectWiseView extends StatefulWidget {
  String subjectName;
  String coachingName;
  String examType;
  bool isHome;

  SubjectWiseView(
      {super.key,
      required this.isHome,
      required this.coachingName,
      required this.examType,
      required this.subjectName});

  @override
  State<SubjectWiseView> createState() => _SubjectWiseViewState();
}

class _SubjectWiseViewState extends State<SubjectWiseView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController? _scrollController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    _tabController!.dispose();
    super.dispose();
  }

  final imagesURL = [
    'assets/books_covers/1.jpg',
    'assets/books_covers/3.jpg',
    'assets/books_covers/4.jpg',
    'assets/books_covers/5.jpg',
    'assets/books_covers/8.jpg',
  ];
  final imagesURLHindi = [
    'assets/books_covers/hindi/h1.jpg',
    'assets/books_covers/hindi/h2.jpg',
    'assets/books_covers/hindi/h3.jpg',
    'assets/books_covers/hindi/h4.jpg',
    'assets/books_covers/hindi/h6.jpg',
  ];
  final booksNames = [
    'Jodi Picoult',
    'Heart Spring ',
    'Kristin Hannah',
    'Leave the world',
    'The Indian English',
  ];

  bool englishPressed = true;

  @override
  Widget build(BuildContext context) {
    return widget.isHome
        ? Scaffold(
            appBar: AppBar(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.subjectName,
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "${widget.coachingName}, ${widget.examType}",
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
              bottom: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.white,
                isScrollable: true,
                indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey.shade400,
                tabs: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Tab(text: "Pre"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Tab(text: "Mains"),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "English",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: englishPressed == true
                                    ? Colors.blue
                                    : Colors.black),
                          ),
                          Switch(
                              value: englishPressed == false ? true : false,
                              activeTrackColor: Colors.blue.shade200,
                              onChanged: (value) {
                                setState(() {
                                  englishPressed = !englishPressed;
                                });
                              }),
                          Text(
                            "Hindi",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: englishPressed == false
                                    ? Colors.blue
                                    : Colors.black),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          primary: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 2,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.6),
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                if (englishPressed) {
                                  Get.to(SpecificBooksViews(
                                    category:
                                        "${widget.subjectName}, ${widget.coachingName} ${widget.examType}",
                                    bookName: booksNames[index],
                                    imageURL: imagesURL[index],
                                  ));
                                } else {
                                  Get.to(SpecificBooksViews(
                                    category:
                                        "${widget.subjectName}, ${widget.coachingName} ${widget.examType}",
                                    bookName: booksNames[index],
                                    imageURL: imagesURLHindi[index],
                                  ));
                                }
                                // Get.to(SubjectWiseView(
                                //   coachingName: '${widget.map['name'][widget.index]}',
                                //   examType:
                                //   '${dashboardController.examCategories.value}',
                                //   subjectName:
                                //   '${coursesNames['name'][index].toString()}',
                                // ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 3,
                                  color: Colors.white,
                                  child: Container(
                                    padding: EdgeInsets.only(right: 10),
                                    color: Colors.transparent,
                                    alignment: Alignment.bottomRight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: double.maxFinite,
                                          child: Image.asset(
                                            englishPressed == true
                                                ? imagesURL[index]
                                                : imagesURLHindi[index],
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              '${booksNames[index]}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ],
            ),
          )
        : Scaffold(
            body: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "English",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: englishPressed == true
                                    ? Colors.blue
                                    : Colors.black),
                          ),
                          Switch(
                              value: englishPressed == false ? true : false,
                              activeTrackColor: Colors.blue.shade200,
                              onChanged: (value) {
                                setState(() {
                                  englishPressed = !englishPressed;
                                });
                              }),
                          Text(
                            "Hindi",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: englishPressed == false
                                    ? Colors.blue
                                    : Colors.black),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                          padding: EdgeInsets.zero,
                          physics: AlwaysScrollableScrollPhysics(),
                          primary: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 2,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.6),
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                if (englishPressed) {
                                  Get.to(SpecificBooksViews(
                                    category:
                                        "${widget.subjectName}, ${widget.coachingName} ${widget.examType}",
                                    bookName: booksNames[index],
                                    imageURL: imagesURL[index],
                                  ));
                                } else {
                                  Get.to(SpecificBooksViews(
                                    category:
                                        "${widget.subjectName}, ${widget.coachingName} ${widget.examType}",
                                    bookName: booksNames[index],
                                    imageURL: imagesURLHindi[index],
                                  ));
                                }
                                // Get.to(SubjectWiseView(
                                //   coachingName: '${widget.map['name'][widget.index]}',
                                //   examType:
                                //   '${dashboardController.examCategories.value}',
                                //   subjectName:
                                //   '${coursesNames['name'][index].toString()}',
                                // ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 3,
                                  color: Colors.white,
                                  child: Container(
                                    padding: EdgeInsets.only(right: 10),
                                    color: Colors.transparent,
                                    alignment: Alignment.bottomRight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: double.maxFinite,
                                          child: Image.asset(
                                            englishPressed == true
                                                ? imagesURL[index]
                                                : imagesURLHindi[index],
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              '${booksNames[index]}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
