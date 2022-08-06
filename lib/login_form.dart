import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeme/join_page.dart';

import 'components/custom_elevated_button.dart';
import 'components/custom_text_form_field.dart';

class LoginFormPage extends StatefulWidget {
  const LoginFormPage({Key? key}) : super(key: key);

  @override
  State<LoginFormPage> createState() => _LoginFormPage();
}

class _LoginFormPage extends State<LoginFormPage> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        title:
        Text('See Me', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: Icon(Icons.login))
        ],
      ),

      body:
      Padding(padding: const EdgeInsets.all(10),

        child: ListView(
        children: [
          SizedBox(height: 150,),

          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(hint: "아이디를 입력하세요",fnValidator: (value){
                      print(value); // 이런식으로 로그 찍어볼 수 있음.
                  },),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(hint: "비밀번호를 입력하세요",fnValidator: (value){},),
                ),

                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomElevatedButton(text: "로그인", fnPageRoute: () {},),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomElevatedButton(text: "회원가입", fnPageRoute: () {
                    _formKey.currentState!.validate();
                    Get.to(JoinPage());
                  } ),
                  ),
                ],
            ),
          ),

          
        ],
      ),
      ),

    );
  }
}



