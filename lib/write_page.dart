import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'board_page.dart';
import 'camera_page.dart';
import 'chatroom_page.dart';

class WritePage extends StatefulWidget {
  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage>{

  // late ScrollController _scrollController;
  ScrollController? _scrollController;

  @override
  void initState(){
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose(){
    _scrollController?.dispose();
    super.dispose();
  }

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

      body:Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: <Widget>[
              TextField(
                style: TextStyle(fontSize: 30.0,),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                // obscureText: true,  // 비밀번호
                decoration: InputDecoration(
                  // border: OutlineInputBorder(), // 외곽선
                  hintText: '제목을 적어주세요.',
                ),
              ),
              Padding( padding: EdgeInsets.all(10),),
              TextField(
                onTap: (){
                  _scrollController?.animateTo(280.0, duration: Duration(milliseconds: 500), curve: Curves.ease);
                },
                style: TextStyle(fontSize: 25.0,),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                // obscureText: true,  // 비밀번호
                decoration: InputDecoration(
                  // border: OutlineInputBorder(), // 외곽선
                  hintText: '내용을 적어주세요.',
                ),
              ),
            ],
          ),
        ),

      ),

      // Container(padding: EdgeInsets.all(8),
      //     child: SafeArea(
      //       child: SingleChildScrollView(
      //
      //
      //
      //       ),
      //     )
      // ),

      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.yellow,
        selectedFontSize: 22,
        unselectedFontSize: 17,
        items: <BottomNavigationBarItem>[
           BottomNavigationBarItem(icon: Icon(Icons.save), label: '글쓰기'),
           BottomNavigationBarItem(icon: Icon(Icons.delete), label: '취소'),
        ]
      ),
    );
  }

}


