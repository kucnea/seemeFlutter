import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_detail_page.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[

         //  Row(
         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
         //   children: <Widget>[
         //
         //     Flexible(flex: 4,child: SizedBox(
         //       width: 130,
         //       height: 130,
         //       child: Image.network('https://cdn.pixabay.com/photo/2022/04/04/18/03/bird-7111988_960_720.jpg'),
         //     ),),
         //
         //     Flexible(flex: 6,child: RichText(text: TextSpan(children: [
         //       TextSpan(
         //         text: '첫번째 채팅방',
         //         style: TextStyle(fontSize: 32),
         //       )
         //     ])),),
         //
         //
         //   ],
         // ),

        ListView.separated(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){
                Get.to(ChatDetailPage());
              },
              // leading: Image.network('https://cdn.pixabay.com/photo/2022/04/04/18/03/bird-7111988_960_720.jpg',),
              title: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Flexible(flex: 4,child: SizedBox(
                    width: 130,
                    height: 130,
                    child: Image.network('https://cdn.pixabay.com/photo/2022/04/04/18/03/bird-7111988_960_720.jpg'),
                  ),),

                  Flexible(flex: 6,child: RichText(text: TextSpan(children: [
                    TextSpan(
                      text: '첫번째 채팅방',
                      style: TextStyle(fontSize: 32),
                    )
                  ])),),
                ],

              ),
              // title: Text('두번째 채팅방'),
            );
          }, separatorBuilder: (BuildContext context, int index) {
            return Divider();
        },

        ),
        ],
      ),
    );
  }
}
