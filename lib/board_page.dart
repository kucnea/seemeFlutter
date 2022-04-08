import 'package:flutter/material.dart';
import 'package:seeme/camera_page.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  int _selectedIndex = 0;

  List _pages = [
    CameraPage(),
    Text('page2'),
    Text('page3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text('See Me', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
      ),
      body: Center(child: _pages[_selectedIndex],),
      bottomNavigationBar: BottomNavigationBar(
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
