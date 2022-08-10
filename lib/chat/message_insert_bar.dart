import 'package:flutter/material.dart';

class MessageInsertBar extends StatefulWidget{
  const MessageInsertBar({Key? key}) : super(key: key);

  @override
  State<MessageInsertBar> createState() => _MessageInsertBarState();
}

class _MessageInsertBarState extends State<MessageInsertBar> {

  var _userEnterMessage = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(8.0),
      child: Row(
          children: [
            Expanded(
              child: TextField(

                decoration: InputDecoration(
                    hintText: '메세지를 입력해주세요.'
                ),
                onChanged: (value){
                  setState(() {
                    _userEnterMessage = value;
                  });
                },
              ),
            ),


            IconButton(
              onPressed: _userEnterMessage.trim().isEmpty? null : (){

              },
              icon: Icon(Icons.send),
              color: Colors.yellow,
            ),

          ]
      ),

    );
  }

  void sendMessage(){
    FocusScope.of(context).unfocus(); // unFocus message bar
    // send message
  }

}