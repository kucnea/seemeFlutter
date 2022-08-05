import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seeme/write_page.dart';

class BoardPage extends StatefulWidget {
  // const BoardPage({Key? key}) : super(key: key);

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

        ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            ...loadBoard() // ...은 반복적으로 LoadMemo 메소드를 반복시킴
          ],
        ),


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

  List<Widget> loadBoard() {
    List<Widget> boardList = [];

    boardList.add(Container( margin: const EdgeInsets.all(10), padding: const EdgeInsets.all(5), height: 70,
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
    ),);

    return boardList;
  }

  }








