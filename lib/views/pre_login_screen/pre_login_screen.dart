import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../pre_signin_screen/pre_signin_view.dart';
import '../sign_up_screen/signup_view.dart';

class PreLoginScreen extends StatelessWidget {
  const PreLoginScreen({Key? key}) : super(key: key);

  Widget _buildImage() {
    return Image.asset(
      'assets/onboarding-images/android_logo.png',
      fit: BoxFit.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    var kH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Hero(tag: 'LOGO', child: _buildImage()),
            ),
          ),
          SizedBox(
            height: kH * 0.02,
          ),
          const Text(
            "Register to use NDN",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: kH * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                height: 40,
                child: Row(
                  children: [
                    Image.asset(
                        'assets/social_logo/google-logo-history-png-2603.png'),
                    const Spacer(),
                    const Text(
                      "Register with google",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: kH * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: InkWell(
              onTap: () {
                Get.to(SignupView());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                height: 40,
                child: Row(
                  children: [
                    Image.asset('assets/social_logo/email-logo-png-1111.png'),
                    const Spacer(),
                    const Text(
                      "Register with email",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: kH * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Already have an account?",
                style: TextStyle(fontSize: 14),
              ),
              TextButton(
                  onPressed: () {
                    Get.to(PreSignInScreen());
                  },
                  child: const Text(
                    "Login here",
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  )),
            ],
          ),
          SizedBox(
            height: kH * 0.02,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "By clicking here, I state that I have read and understood the terms and conditions.",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: kH * 0.02,
          ),
        ],
      ),
    );
  }
}
