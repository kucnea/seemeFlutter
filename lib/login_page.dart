import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


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
            Padding(padding: EdgeInsets.all(50),),
            SignInButton(Buttons.Google, onPressed: () {}),
            SignInButton(Buttons.GitHub, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
