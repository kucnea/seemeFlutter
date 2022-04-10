import 'package:flutter/material.dart';
import 'package:seeme/chat_detail_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             SizedBox(
               width: 130,
               height: 130,
               child: Image.network('https://cdn.pixabay.com/photo/2022/04/04/18/03/bird-7111988_960_720.jpg'),
             ),
             Padding(padding: EdgeInsets.all(10)),
             RichText(text: TextSpan(children: [
               TextSpan(
                 text: '첫번째 채팅방',
                 style: TextStyle(fontSize: 32),
               )
             ]))
           ],
         ),
        ],
      ),
    );
  }
}
