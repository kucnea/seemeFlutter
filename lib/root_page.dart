import 'package:flutter/material.dart';
import 'package:seeme/form_page.dart';
import 'package:seeme/login_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormPage();
    // return LoginPage();
  }
}
