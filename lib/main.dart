import 'package:flutter/material.dart';
import 'package:seeme/root_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seeme Project',
      theme: ThemeData(
        // primaryColor: Colors.white, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: Colors.black),
        brightness: Brightness.dark,
      ),
        home: RootPage(),
    );
  }
}


