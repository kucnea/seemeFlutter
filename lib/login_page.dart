import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'board_page.dart';
import 'components/custom_elevated_button.dart';
import 'form_page.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('SeeMe',
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.all(30),),
            // RichText(
            //     text: TextSpan(text: '비로그인',children: [
            //       TextSpan(
            //         text: '비로그인',
            //         recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => BoardPage())
            //       ))
            //     ])
            // ),
            // RichText(
            //     text: TextSpan(text: '비로그인',
            //              recognizer: TapGestureRecognizer()
            //                ..onTap = () => Navigator.push(context,
            //                    MaterialPageRoute(builder: (context) => BoardPage()))
            //     )
            //     ),
            ElevatedButton(
              child: Text('비로그인',style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black54),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => FormPage()));
              },
              style: ElevatedButton.styleFrom(primary: Colors.white, fixedSize: Size.fromWidth(220.0)),
            ),

            SignInButton(Buttons.Google, onPressed: () {}),
            SignInButton(Buttons.GitHub, onPressed: () {}),

            ElevatedButton(
              child: Text('로그인/회원가입',style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black54),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => LoginFormPage()));
              },
              style: ElevatedButton.styleFrom(primary: Colors.white, fixedSize: Size.fromWidth(220.0)),
            ),
          ],
        ),
      ),
    );
  }
}
