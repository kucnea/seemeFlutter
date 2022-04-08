import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(child: Text('도움게시판\n', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),),
          ElevatedButton(
            onPressed: () => {},
            child: Text('글쓰기'),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              textStyle: TextStyle(
                fontSize: 22,
              )
            ), ),
        ],
      ),
    );
  }
}
