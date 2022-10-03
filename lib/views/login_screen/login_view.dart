import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_digital_notes/views/dashboard_screen/dashboard_view.dart';
import 'package:national_digital_notes/views/forgot_screen/forgot_view.dart';
import 'package:national_digital_notes/views/pre_login_screen/pre_login_screen.dart';

import '../../utils/constants/heading_text_styles.dart';
import '../../utils/constants/my_colors.dart';

class LoginView extends StatefulWidget {
  LoginView();

  @override
  LoginViewState createState() => new LoginViewState();
}

class LoginViewState extends State<LoginView> {
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
        child: ListView(children: [
          Center(
            child: Container(
              alignment: Alignment.topLeft,
              width: 80,
              height: 80,
              child: Hero(
                  tag: 'LOGO',
                  child:
                      Image.asset('assets/onboarding-images/android_logo.png')),
            ),
          ),
          Container(height: 15),
          Center(
            child: Text("Welcome Back,",
                style: MyText.title(context)!.copyWith(
                    color: MyColors.grey_80, fontWeight: FontWeight.bold)),
          ),
          Container(height: 5),
          Center(
            child: Text("Login to continue",
                style: MyText.subhead(context)!.copyWith(
                    color: Colors.blueGrey[300], fontWeight: FontWeight.bold)),
          ),
          Container(height: 50),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: Container(
              height: 50,
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: Container(
              height: 50,
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
          ),
          Container(height: 5),
          Row(
            children: <Widget>[
              Spacer(),
              TextButton(
                style: TextButton.styleFrom(primary: Colors.transparent),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.blue[400]),
                ),
                onPressed: () {
                  Get.to(ForgotScreen());
                },
              )
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent[400], elevation: 0),
              child: Text("Login", style: TextStyle(color: Colors.white)),
              onPressed: () {
                Get.to(DashboardView());
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(primary: Colors.transparent),
              child: Text("New user? Sign Up",
                  style: TextStyle(color: Colors.blueAccent[400])),
              onPressed: () {
                Get.to(const PreLoginScreen());
              },
            ),
          )
        ]),
      ),
    );
  }
}
