import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeme/join_page.dart';

class CustomElevatedButton extends StatelessWidget {

  final String text;
  final fnPageRoute;

  const CustomElevatedButton({required this.text, required this.fnPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: fnPageRoute,
      child: Text('$text',style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black54),),
      style: ElevatedButton.styleFrom(primary: Colors.white, minimumSize: Size(double.infinity, 50.0), ),
    );
  }
}