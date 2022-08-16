import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String hint;
  final fnValidator;
  final controller;

  const CustomTextFormField({required this.hint, required this.fnValidator, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: fnValidator,
      obscureText: hint == "비밀번호를 입력하세요" ? true : false,
      controller: controller,
      decoration: InputDecoration(
        hintText: "$hint",
      ),


      // decoration: InputDecoration(                   // 칸 안에 넣고, 동그란 외곽선
      //   enabledBorder: OutlineInputBorder(           // focusBorder 사용하면 클릭시 외곽선등
      //     borderRadius: BorderRadius.circular(10),
      //   ),
      // ),
    );
  }
}