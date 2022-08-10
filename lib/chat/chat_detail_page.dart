import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'message.dart';
import 'message_insert_bar.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {

  @override
  Widget build(BuildContext context) {

    String data = Get.arguments;

    return Scaffold(

      appBar: AppBar(),

      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Messages(),
            ),
            MessageInsertBar(),
          ],
        ),
      ),


    );

  }
}
