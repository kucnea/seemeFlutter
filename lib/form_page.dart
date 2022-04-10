import 'package:flutter/material.dart';
import 'package:seeme/board_page.dart';
import 'package:seeme/camera_page.dart';
import 'package:seeme/chatroom_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  int _selectedIndex = 0;

  List _pages = [
    CameraPage(),
    BoardPage(),
    ChatRoomPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:
        Text('See Me', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: Icon(Icons.login))
        ],
      ),


      body: Container(padding: EdgeInsets.all(8),
          child: SafeArea(
            child: SingleChildScrollView(
              child: _pages[_selectedIndex],
            ),
          )
      ),
      //Container(padding: EdgeInsets.all(8),child: Center(child: _pages[_selectedIndex],)),
      //Container(padding: EdgeInsets.all(8),child: _pages[_selectedIndex],),
      //Center(child: _pages[_selectedIndex],),


      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.yellow,
        selectedFontSize: 22,
        unselectedFontSize: 17,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'AI 카메라'),
        BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: '도움게시판'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: '메신저'),
      ],),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
