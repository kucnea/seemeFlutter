import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeme/Screens/board/write_page.dart';

import 'board_detail_page.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  State<BoardPage> createState() => _BoardPageState();

}

class _BoardPageState extends State<BoardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(children: <Widget>[
        Center(child: Text('도움게시판\n', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),),

        ListView.separated(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                // onTap: (){
                //   Get.to(BoardDetailPage(), arguments: "$index 데이터");
                // },
                onTap: (){
                  Get.to(BoardDetailPage(index: index), arguments: "argument");
                },
                title: Text("제목1", style: TextStyle(color: Colors.white ,fontSize: 30.0, fontWeight: FontWeight.bold),),
                leading: Text("1"),
              );
            }, separatorBuilder: (context, index) {
              return Divider();
          },
        ),
        
        // ListView(
        //   scrollDirection: Axis.vertical,
        //   shrinkWrap: true,
        //   children: <Widget>[
        //     ...loadBoard() // ...은 반복적으로 LoadMemo 메소드를 반복시킴
        //   ],
        // ),

        SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: (){
                Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => WritePage())
                );
              },
              tooltip: '글쓰기를 하려면 클릭하세요',
              label: Text('글쓰기',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.black),),
              icon: Icon(Icons.add),
              backgroundColor: Colors.grey,
            ),
          ],
        ),

        // ElevatedButton(
        //   onPressed: () => {},
        //   child: Text('글쓰기'),
        //   style: ElevatedButton.styleFrom(
        //     primary: Colors.black,
        //     textStyle: TextStyle(
        //       fontSize: 22,
        //     )
        //   ), ),
      ],
      ),
    );
  }

  // List<Widget> loadBoard() {
  //   List<Widget> boardList = [];
  //
  //   boardList.add(Container( margin: const EdgeInsets.all(10), padding: const EdgeInsets.all(5), height: 70,
  //     decoration: BoxDecoration(
  //       color: Colors.grey,
  //       ),
  //     ),
  //   );
  //
  //   return boardList;
  // }

  }








