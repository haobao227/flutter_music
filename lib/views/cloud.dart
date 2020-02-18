import 'package:flutter/material.dart';  //google风格的库
import 'package:flutter/cupertino.dart';  // ios风格  对苹果手机比较友好



class Cloud extends StatefulWidget {
  @override
  _CloudState createState() => _CloudState();
}

class _CloudState extends State<Cloud> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('这是云村页面'),
    );
  }
}
