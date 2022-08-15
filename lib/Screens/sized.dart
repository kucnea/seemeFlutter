

import 'package:flutter/cupertino.dart';


double getScreenWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

double getDrawerWidth(BuildContext context){
  return MediaQuery.of(context).size.width * 0.7;
}