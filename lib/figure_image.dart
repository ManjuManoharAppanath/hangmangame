import 'package:flutter/cupertino.dart';

Widget figureImage(bool visible,String path){
  return Visibility(
      visible: visible,
      child: Container(height: 250,
        width: 250,
        child:Image.asset(path) ,
      ),);
}