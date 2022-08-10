import 'package:flutter/material.dart';

class Messages extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: 2,
                itemBuilder: (context, index){
                  return Text("첫번째 메세지");
                },
            ),
          )
        ],
      ),
    );
  }

}
