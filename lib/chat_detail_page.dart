import 'package:flutter/material.dart';

class chatDetailPage extends StatefulWidget {
  const chatDetailPage({Key? key}) : super(key: key);

  @override
  State<chatDetailPage> createState() => _chatDetailPageState();
}

class _chatDetailPageState extends State<chatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
        SizedBox(
        width: 80,
        height: 80,
        child: CircleAvatar(
          backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2022/04/04/18/03/bird-7111988_960_720.jpg'),
        ),
      ),
      ]
      ),
    );
  }
}
