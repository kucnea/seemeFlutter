import 'package:flutter/material.dart';
import 'chat_cloud.dart';

class Messages extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: 1,
                itemBuilder: (context, index){
                  return ChatCloud("첫번째 메세지","유저아이디",false);
                },
            ),
          )
        ],
      ),
    );
  }

}
