import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_digital_notes/views/onboarding_screen/onboarding_screen.dart';

import '../../utils/constants/const_strings.dart';
import '../../utils/constants/heading_text_styles.dart';
import '../../utils/constants/my_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Get.to(OnBoardingPage());

    ///USE GET X HERE FOR NAVIGATION
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Container(
                height: 100,
                width: 100,
                child:
                    Image.asset('assets/onboarding-images/android_logo.png')),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                projectName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            Container(height: 20),
            Container(
              height: 5,
              width: 80,
              child: LinearProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(MyColors.primaryLight),
                backgroundColor: Colors.grey[300],
              ),
            ),
            Spacer(),
            Text("V 1.0.1",
                style:
                    MyText.body1(context)!.copyWith(color: Colors.grey[500])),
            Container(height: 20),
          ],
        ));
  }
}
