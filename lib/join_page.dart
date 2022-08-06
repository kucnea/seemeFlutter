import 'package:flutter/material.dart';

import 'components/custom_elevated_button.dart';
import 'components/custom_text_form_field.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  State<JoinPage> createState() => _JoinPage();
}

class _JoinPage extends State<JoinPage> {
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

            Form(child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(hint: "아이디를 입력하세요", fnValidator: (value){},),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(hint: "비밀번호를 입력하세요",fnValidator: (value){},),
                ),

                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomElevatedButton(text: "회원가입", fnPageRoute: (){},),
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



