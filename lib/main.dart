import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeme/Screens/root_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Seeme Project',
      theme: ThemeData(
        // primaryColor: Colors.white, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: Colors.black),
        brightness: Brightness.dark,
      ),
        home: RootPage(),
    );
  }
}


