import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeme/Model/ViewerModel.dart';

import '../components/custom_elevated_button.dart';
import '../components/custom_text_form_field.dart';
import '../form_page.dart';
import '../util/validator_util.dart';
import 'join_page.dart';
import 'package:http/http.dart' as http;

class LoginFormPage extends StatefulWidget {
  const LoginFormPage({Key? key}) : super(key: key);

  @override
  State<LoginFormPage> createState() => _LoginFormPage();
}


Future<ViewerModel?> loginViewer(
    String vId, String vPw, BuildContext context) async{
  var _viewer = ViewerModel(vIdx: 0, vId: "", vPw: "", vNick: "");
  var Url = "http://10.0.2.2:8060/loginviewer";
  var response = await http.post(Uri.parse(Url),
      headers:<String, String>{"Content-Type":"application/json"},
      body:jsonEncode(<String, String>{
        "vid":vId,
        "vpw":vPw,
      }));

  if(response.statusCode == 200){
    var jsonData = json.decode(response.body);
    var content = "";

    if(jsonData["vid"]==null){
      _viewer.vId = "";
      _viewer.vNick = "";
    }else{
      _viewer.vId = jsonData["vid"];
      _viewer.vNick = jsonData["vnick"];
    }
    print("loginViewer stage final");
    print(_viewer.vId);

    _viewer.vId.length == 0? content = "로그인에 실패했습니다." : content = _viewer.vNick+"님 환영합니다.";

    showDialog(context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext){
        return LoginAlertDialog(title: '알람', content: content);
      },
    );
  }else{
    print("http status is not 200 ok");
    print(response.statusCode);
  }

  return _viewer;
}




class _LoginFormPage extends State<LoginFormPage> {

  final _formKey = GlobalKey<FormState>();
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
                  child: CustomElevatedButton(text: "로그인", fnPageRoute: () async {

                    String vId = idController.text;
                    String vPw = pwController.text;
                    ViewerModel? viewerModel = null;

                    if(_formKey.currentState!.validate()) {
                      ViewerModel? viewerModel = await loginViewer(
                          vId, vPw, context);
                    }
                    idController.text = "";
                    pwController.text = "";
                    print("login stage last part");
                    print(viewerModel?.vId);

                    setState(() {
                      _viewerModel = viewerModel;
                    });
                    // if(_formKey.currentState!.validate()){
                    //   Get.to(FormPage());
                    // }

                  },),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomElevatedButton(text: "회원가입", fnPageRoute: () {
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

class LoginAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  LoginAlertDialog({
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
        FlatButton(
            onPressed: () =>
            this.content == "로그인에 실패했습니다."?
            Navigator.pop(context) :
            Get.to(()=>FormPage()),
            child: Text("확인", style: TextStyle(fontSize: 20.0),))
      ],
      content: Text(
        this.content,
        // style: Theme.of(context).textTheme.bodyLarge,
        style: TextStyle(fontSize: 25.0),
      ),
    );
  }
}



