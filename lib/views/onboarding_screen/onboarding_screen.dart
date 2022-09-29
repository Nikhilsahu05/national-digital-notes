import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../pre_login_screen/pre_login_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  int currentPageIndex = 0;
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Get.to(const PreLoginScreen());
  }

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              currentPageIndex = value;
            });
          },
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Image.asset(
                'assets/onboarding-images/Frame 1.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: Image.asset(
                'assets/onboarding-images/Frame 3.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: Image.asset(
                'assets/onboarding-images/Frame 2.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ]),
      Positioned(
        bottom: 10,
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.slowMiddle);
                      currentPageIndex = 2;
                    });
                  },
                  child: const Text("Skip")),
              DotsIndicator(
                dotsCount: 3,
                position: double.parse(currentPageIndex.toString()),
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
