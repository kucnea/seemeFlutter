import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';



class ChatCloud extends StatelessWidget {
  const ChatCloud(this.message, this.userName, this.isMe, {Key? key}) : super(key: key);

  final String message;
  final String userName;
  final bool isMe;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if(isMe)
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,10,0),
            child: ChatBubble(
              clipper: ChatBubbleClipper4(type: BubbleType.sendBubble),
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 20),
              backGroundColor: Colors.yellow,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Text(
                  "$message",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        if(!isMe)
          Padding(
            padding: const EdgeInsets.fromLTRB(10,0,0,0),
            child: ChatBubble(
              clipper: ChatBubbleClipper4(type: BubbleType.receiverBubble),
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 20),
              backGroundColor: Colors.white,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Text(
                  "$message",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
