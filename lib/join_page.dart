import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:seeme/login_form.dart';
import 'package:seeme/login_page.dart';
import 'package:seeme/util/validator_util.dart';

import 'components/custom_elevated_button.dart';
import 'components/custom_text_form_field.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  State<JoinPage> createState() => _JoinPage();
}

class _JoinPage extends State<JoinPage> {

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
                    child: CustomTextFormField(hint: "아이디를 입력하세요", fnValidator: userid_validate(),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFormField(hint: "비밀번호를 입력하세요",fnValidator: (value){},),
                  ),

                  SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomElevatedButton(text: "회원가입", fnPageRoute: () {
                      if(_formKey.currentState!.validate()){
                        print("여기");
                        Get.to(LoginFormPage());
                      }
                    }),
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



