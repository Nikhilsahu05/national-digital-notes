import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_digital_notes/views/about_screen/about_us_view.dart';
import 'package:national_digital_notes/views/login_screen/login_view.dart';
import 'package:national_digital_notes/views/verification_screen/verification_views.dart';

import '../../controllers/profile_settings_controller.dart';
import '../../utils/constants/heading_text_styles.dart';
import '../../utils/constants/my_colors.dart';
import '../privacy_and_terms.dart';

class SettingProfileRoute extends StatefulWidget {
  const SettingProfileRoute({super.key});

  @override
  SettingProfileRouteState createState() => SettingProfileRouteState();
}

class SettingProfileRouteState extends State<SettingProfileRoute> {
  final controller = Get.put(ProfileSettingsController());

  var isdark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey_10,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 180.0,
              floating: false,
              pinned: true,
              backgroundColor: MyColors.primary,
              flexibleSpace: const FlexibleSpaceBar(),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(190),
                child: SizedBox(
                  height: 190,
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/home_screen_images/material_bg_1.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50, left: 14),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey[100],
                          child: const CircleAvatar(
                            radius: 55,
                            backgroundImage: AssetImage(
                                'assets/home_screen_images/Screenshot 2022-09-29 153032.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 60,
                        left: 100,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Tanmay Sasvadkar",
                                  style: MyText.body2(context)!.copyWith(
                                      color: Colors.grey[100],
                                      fontWeight: FontWeight.bold)),
                              Container(height: 5),
                              Text("tanmay@immersiveinfotech.com",
                                  style: MyText.body2(context)!
                                      .copyWith(color: Colors.grey[100]))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                PopupMenuButton<String>(
                  onSelected: (String value) {
                    Get.offAll(const LoginView());
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: "Logout",
                      child: Text("Logout"),
                    ),
                  ],
                )
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Edit",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Switch(
                              value: true,
                              onChanged: (_) {},
                            ),
                          ],
                        )),
                    InkWell(
                      highlightColor: Colors.grey.withOpacity(0.1),
                      splashColor: Colors.grey.withOpacity(0.1),
                      onTap: () => () {},
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "Tanmay Sasvadkar",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text("Name",
                                  style: MyText.body1(context)!
                                      .copyWith(color: MyColors.grey_40)),
                            ],
                          )),
                    ),
                    const Divider(height: 0),
                    InkWell(
                      highlightColor: Colors.grey.withOpacity(0.1),
                      splashColor: Colors.grey.withOpacity(0.1),
                      onTap: () => () {},
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "+61883762938",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text("Phone",
                                  style: MyText.body1(context)!
                                      .copyWith(color: MyColors.grey_40)),
                            ],
                          )),
                    ),
                    const Divider(height: 0),
                    InkWell(
                      highlightColor: Colors.grey.withOpacity(0.1),
                      splashColor: Colors.grey.withOpacity(0.1),
                      onTap: () => () {},
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "tanmay@immersiveinfotech.com",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text("e-mail",
                                  style: MyText.body1(context)!
                                      .copyWith(color: MyColors.grey_40)),
                            ],
                          )),
                    ),
                    const Divider(height: 0),
                  ],
                ),
              ),
              Container(height: 10),
              Card(
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Settings",
                              style: MyText.subhead(context)!.copyWith(
                                  color: MyColors.primaryDark,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Container(height: 10),
                    const Divider(height: 0),
                    InkWell(
                      highlightColor: Colors.grey.withOpacity(0.1),
                      splashColor: Colors.grey.withOpacity(0.1),
                      onTap: () => () {},
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Get.to(const VerificationCodeRoute());
                                },
                                child: Text("Set Password",
                                    style: MyText.medium(context).copyWith()),
                              ),
                              const Spacer(),
                              const Text(""),
                            ],
                          )),
                    ),
                    const Divider(height: 0),
                    InkWell(
                      highlightColor: Colors.grey.withOpacity(0.1),
                      splashColor: Colors.grey.withOpacity(0.1),
                      onTap: () => () {},
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Row(
                            children: <Widget>[
                              Text("Delete Account",
                                  style: MyText.medium(context).copyWith()),
                              const Spacer(),
                              const Icon(
                                Icons.delete,
                                color: Colors.grey,
                              )
                            ],
                          )),
                    ),
                    const Divider(height: 0),
                    InkWell(
                      highlightColor: Colors.grey.withOpacity(0.1),
                      splashColor: Colors.grey.withOpacity(0.1),
                      onTap: () => () {},
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Row(
                            children: <Widget>[
                              Text("Mode",
                                  style: MyText.medium(context).copyWith()),
                              const Spacer(),
                              const Text("Light"),
                              GetBuilder<ProfileSettingsController>(
                                builder: (_) => Switch(
                                    value: controller.isdark,
                                    onChanged: (state) {
                                      controller.changeTheme(state);
                                    }),
                              ),
                              const Text("Dark"),
                            ],
                          )),
                    ),
                    const Divider(height: 0),
                  ],
                ),
              ),
              Container(height: 10),
              Card(
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Support",
                              style: MyText.subhead(context)!.copyWith(
                                  color: MyColors.primaryDark,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Container(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(const TermsScreen());
                        },
                        child: const Text(
                          "Terms",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(const PoliciesScreen());
                        },
                        child: const Text(
                          "Privacy",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(const AboutAppSimpleBlueRoute());
                        },
                        child: const Text(
                          "About",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
              Container(height: 15),
              Text("Build Version 1.0.1",
                  style: MyText.caption(context)!
                      .copyWith(color: MyColors.grey_40)),
              Container(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
