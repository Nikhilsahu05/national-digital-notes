import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/constants/heading_text_styles.dart';
import '../../utils/constants/my_colors.dart';
import '../privaceAndTerms_screens.dart';

class AboutAppSimpleBlueRoute extends StatefulWidget {
  const AboutAppSimpleBlueRoute({super.key});

  @override
  AboutAppSimpleBlueRouteState createState() => AboutAppSimpleBlueRouteState();
}

class AboutAppSimpleBlueRouteState extends State<AboutAppSimpleBlueRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        title: const Text("About", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("National Digital Notes",
                style: MyText.display1(context)!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w300)),
            Container(height: 5),
            Container(width: 120, height: 3, color: Colors.white),
            Container(height: 15),
            Text("Version",
                style:
                    MyText.body1(context)!.copyWith(color: MyColors.grey_20)),
            Text("V 1.0.1",
                style: MyText.medium(context).copyWith(color: Colors.white)),
            Container(height: 15),
            const Text(
              "Website legal agreements, such as Terms and Conditions, Terms of Service, and Terms of Use, typically need to be revised and updated from time to time in order to add new provisions or adapt to new laws."
              "\n"
              "\n"
              "Terms and Conditions, Terms of Service, and Terms of Use, typically need to be revised and updated from time to time in order to add new provisions or adapt to new laws.",
              style: TextStyle(color: Colors.white70),
            ),
            const Spacer(),
            Container(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: () {
                  Get.to(const TermsScreen());
                },
                child: Text("Term of services",
                    style:
                        MyText.medium(context).copyWith(color: Colors.white)),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: () {
                  Get.to(const PoliciesScreen());
                },
                child: Text("Privacy Policies",
                    style:
                        MyText.medium(context).copyWith(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
