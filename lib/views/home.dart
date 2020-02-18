import 'package:flutter/material.dart';  //google风格的库
import 'package:flutter/cupertino.dart';  // ios风格  对苹果手机比较友好


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('这是主页面'),
    );
  }
}
