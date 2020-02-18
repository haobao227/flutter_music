import 'package:flutter/material.dart';
import './views/index.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '仿网易云音乐',
      debugShowCheckedModeBanner: false, // 去掉debug标识
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: Container(
        child: IndexPage(),
      ),
    );
  }
}
