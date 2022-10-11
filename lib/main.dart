import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:national_digital_notes/views/main/screens/AppSplashScreen.dart';

// AppStore appStore = AppStore();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      defaultTransition: Transition.fadeIn,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins-Regular',
        primarySwatch: Colors.blue,
      ),
      home: const AppSplashScreen(),
    );
  }
}
