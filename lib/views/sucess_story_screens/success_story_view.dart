import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SuccessStory extends StatefulWidget {
  const SuccessStory({Key? key}) : super(key: key);

  @override
  State<SuccessStory> createState() => _SuccessStoryState();
}

class _SuccessStoryState extends State<SuccessStory> {
  List imagesURL = [
    'assets/books_covers/1.jpg',
    'assets/books_covers/3.jpg',
    'assets/books_covers/4.jpg',
    'assets/books_covers/5.jpg',
    'assets/books_covers/6.jpg'
  ];

  List name = [
    'Shubham Chouksey',
    'Prakritish Bhattacharyya',
    'Abhishek Nishad',
  ];

  List comments = [
    'Best app for UPSC CSE preparation for beginners as well as repeaters. I have downloaded more than 100 apps and found this app very useful and plans are also affordable.',
    'Excellent app. Suggestion: please upgrade dashboard in Grid pattern instead of List pattern. This would be very helpful and easy visible also because there is no provision of font size adjustment. That also be included.',
    'It is very helpful for UPSE aspirants as well as those who want to give state pcs.it provides previous year questions with topic wise which is very helpful for analysis exam requirements. however he doesnt provide pyqs for optional subject.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Success Story"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.topCenter,
            width: 350,
            child: Text(
              "More than 9 in 10 students recommend NDN to their friends and family. Here’s what they have to say!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: [
                1,
                2,
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber.shade100,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                '"${comments[i]}"',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              Container(
                                width: 200,
                                height: 50,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "${name[i]}",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
