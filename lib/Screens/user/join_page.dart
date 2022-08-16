import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Model/ViewerModel.dart';
import '../components/custom_elevated_button.dart';
import '../components/custom_text_form_field.dart';
import '../util/validator_util.dart';
import 'login_form.dart';
import 'package:http/http.dart' as http;

class JoinPage extends StatefulWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  State<JoinPage> createState() => _JoinPage();
}


// 데이터 통신을 위한 부분
// Future<ViewerModel> addViewer(
Future<String> addViewer(
  String vId, String vPw, BuildContext context) async{
   // var Url = "http://localhost:8060/addviewer";
   // 안드로이드 에뮬의 localhost가 pc와 다르므로 하기 url이용
   var Url = "http://10.0.2.2:8060/addviewer";
   var response = await http.post(Uri.parse(Url),
   headers:<String, String>{"Content-Type":"application/json"},
   body:jsonEncode(<String, String>{
     "vid":vId,
     "vpw":vPw,
   }));

   String responseString = response.body;
   if(response.statusCode == 200){
     showDialog(context: context,
         barrierDismissible: false,
         builder: (BuildContext dialogContext){
          // print("test responseBody Check");
          // print(response.body);
          return MyAlertDialog(title: '알람', content: response.body);
         },
     );
   }else{
     print("http status is not 200 ok");
     print(response.statusCode);
   }

   return response.body;
}

class _JoinPage extends State<JoinPage> {

  final _formKey = GlobalKey<FormState>();
  bool? addCheck;

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  ViewerModel? _viewerModel;

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
                    child: CustomTextFormField(
                      hint: "아이디를 입력하세요",
                      fnValidator: userid_validate(),
                      controller: idController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFormField(
                      hint: "비밀번호를 입력하세요",
                      fnValidator: (value){},
                      controller: pwController,
                    ),
                  ),

                  SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomElevatedButton(text: "회원가입", fnPageRoute: () async {
                      // print("Pressed addViewer Button.");
                      String vId = idController.text;
                      String vPw = idController.text;
                      ViewerModel? viewerModel = null;
                      String result = "";

                      if(_formKey.currentState!.validate()){
                        print("validate stage");
                        // viewerModel = await addViewer(vId, vPw, context);
                        result = await addViewer(vId, vPw, context);
                        print(viewerModel?.vId);
                      }
                      vId = "";
                      vPw = "";
                      // setState(() {
                      //   _viewerModel = viewerModel;
                      // });

                      // result == "회원 가입에 성공했습니다."? Get.to(() => LoginFormPage()) : null;

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


class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    required this.title,
    required this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: [
        FlatButton(onPressed: () => Get.to(()=>LoginFormPage()), child: Text("확인", style: TextStyle(fontSize: 20.0),))
      ],
      content: Text(
        this.content,
        // style: Theme.of(context).textTheme.bodyLarge,
        style: TextStyle(fontSize: 25.0),
      ),
    );
  }
}
