import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeme/board/board_page.dart';
import 'package:seeme/form_page.dart';

class BoardDetailPage extends StatefulWidget {

  final int index;

  const BoardDetailPage({Key? key, required this.index }) : super(key: key);

  @override
  _BoardDetailPageState createState() => _BoardDetailPageState(this.index);

}

class _BoardDetailPageState extends State<BoardDetailPage> {

  final int index;
  _BoardDetailPageState(this.index);

  @override
  Widget build(BuildContext context) {

    String data = Get.arguments;

    return Scaffold(

      appBar: AppBar(),

      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(20)),
          // Text("제목! $index $data", style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),),
          Text("제목! $index $data", style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),),
          // Text("제목! $widget.index $data", style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),),
          Padding(padding: const EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {}, 
                child: Text("수정", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                style: ElevatedButton.styleFrom(primary: Colors.white, minimumSize: Size(60.0, 50.0),)
              ),
              SizedBox(width: 10,),
              ElevatedButton(
                  onPressed: () {
                    Get.to(FormPage()); // 뒤로가기가 아닌 새로 로드해야함. 갱신필요.
                  },
                  child: Text("삭제", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                  style: ElevatedButton.styleFrom(primary: Colors.white, minimumSize: Size(60.0, 50.0),)
              ),
            ],
          ),
          Padding(padding: const EdgeInsets.all(5)),
          Divider(),
          Padding(padding: const EdgeInsets.all(5)),
          Expanded(
            child: SingleChildScrollView(
              child: Text("내용"*10, style: TextStyle(fontSize: 25.0),),
            ),
          )

        ],
      ),
      // body: Center(
      //   child: Text("Detail Page $data"),
      // ),

    );

  }
}