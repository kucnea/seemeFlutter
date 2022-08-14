import 'package:flutter/material.dart';
import 'package:seeme/camera/take_picture_screen.dart';

import 'view_camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ViewCamera(),
    );
  }
}

