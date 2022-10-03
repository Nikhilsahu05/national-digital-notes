import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_digital_notes/views/verification_screen/verification_views.dart';

import '../../utils/constants/heading_text_styles.dart';
import '../../utils/constants/my_colors.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(0), child: Container()),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: 30),
            Center(
              child: Container(
                width: 80,
                height: 80,
                child: Hero(
                    tag: 'LOGO',
                    child: Image.asset(
                        'assets/onboarding-images/android_logo.png')),
              ),
            ),
            Container(height: 15),
            Center(
              child: Text("Forgot Password,",
                  style: MyText.title(context)!.copyWith(
                      color: MyColors.grey_80, fontWeight: FontWeight.bold)),
            ),
            Container(height: 5),
            Center(
              child: Text("Enter mail to continue",
                  style: MyText.subhead(context)!.copyWith(
                      color: Colors.blueGrey[300],
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              child: SizedBox(
                height: 50,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
            ),
            Container(height: 5),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent[400], elevation: 0),
                child: Text("Continue", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Get.to(VerificationCodeRoute());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
