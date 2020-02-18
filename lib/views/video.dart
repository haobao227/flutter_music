import 'package:flutter/material.dart';  //google风格的库
import 'package:flutter/cupertino.dart';  // ios风格  对苹果手机比较友好

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  Widget build(BuildContext context) {
    return Container(
      child: Text('这是视屏页面'),
    );
  }
}
