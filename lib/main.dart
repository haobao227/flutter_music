import 'package:flutter/material.dart';
import './views/index.dart';
import 'package:provide/provide.dart';
import './provider/music.dart';
import './router/router.dart';

void main() {
    var music = Music();

    var provider = Providers();

    // 状态放入顶层
    provider
      ..provide(Provider<Music>.value(music));


    runApp(ProviderNode(child: MyApp(),providers: provider));

}
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
      routes: routes,
      home: Container(
        child: IndexPage(),
      ),
    );
  }
}
