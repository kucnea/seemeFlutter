import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ViewCamera extends StatefulWidget {
  const ViewCamera({Key? key,}) : super(key: key);

  @override
  State<ViewCamera> createState() => _ViewCameraState();
}

class _ViewCameraState extends State<ViewCamera> {

  File? image;

  Future pickImageFromGallery() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(()=> this.image = imageTemp);
    } on PlatformException catch(e){
      print("이미지를 불러오는데 실패했습니다. : $e");
    }
  }

  Future pickImageFromCamera() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(()=> this.image = imageTemp);
    } on PlatformException catch(e){
      print("이미지를 불러오는데 실패했습니다. : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            MaterialButton(
              color: Colors.grey,
              child: Text("갤러리", style: TextStyle(fontSize: 30),),
              onPressed: (){ pickImageFromGallery(); },
            ),
            Padding(padding: EdgeInsets.all(10)),
            MaterialButton(
              color: Colors.grey,
              child: Text("카메라", style: TextStyle(fontSize: 30),),
              onPressed: (){ pickImageFromCamera(); },
            ),
            Padding(padding: EdgeInsets.all(10)),
            MaterialButton(
              color: Colors.grey,
              child: Text("초기화", style: TextStyle(fontSize: 30),),
              onPressed: (){
                setState(()=> this.image = null); },
            ),
          ],
        ),
        SizedBox(height: 30,),
        image != null? Image.file(image!) : Text("선택된 이미지가 없습니다.", style: TextStyle(fontSize: 30.0),),
      ],
    );
  }
}
