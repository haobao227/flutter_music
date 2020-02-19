import 'package:flutter/material.dart';  //google风格的库
import 'package:flutter/cupertino.dart';  // ios风格  对苹果手机比较友好
import './home.dart';
import './video.dart';
import './cloud.dart';
import './find.dart';
import './Mydrawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/request.dart';
import 'package:shared_preferences/shared_preferences.dart';
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login();
  }

  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1330)..init(context);

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,  //居中
          elevation: 0,  // 阴影
          title: TabBar(
            isScrollable: true,
            tabs: tabs.map((Tabs tab){
              return Tab(
                text: tab.title,
              );
            }).toList()
          )
        ),
          drawer: Drawer(
             child: Mydrawer(),

          ),
          body: TabBarView(
              children: tabs.map((Tabs tab){
                return TabsTitle(tabs: tab);
              }).toList()
          )
      ),
    );
  }


  Future login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') == null) {
      request('get', '/login/cellphone',
          { 'phone': '15542988632', 'password': 'a123123'}).then((res) async {
        var token = res['token'];
        var profile = res['profile'];
        var account = res['account'];

        prefs.setString('token', token);
        prefs.setString('profile', profile);
        prefs.setString('account', account);

        print('获取的token:' + token);
      });
    } else {
      print('当前的token有效');
    }
  }

}


class Tabs {
  final String title;
  final String component;
  Tabs({this.title,this.component});
}


List<Tabs> tabs = [
  new Tabs(title: '我的', component: 'home'),
  new Tabs(title: '发现', component: 'find'),
  new Tabs(title: '云村', component: 'cloud'),
  new Tabs(title: '视频', component: 'video')
];

class TabsTitle extends StatelessWidget {

  TabsTitle({this.tabs});

  final Tabs tabs;
  @override
  Widget build(BuildContext context) {
    switch(tabs.component) {
      case 'home':
        return Home();
      case 'find':
        return Find();
      case 'cloud':
        return Cloud();
      case 'video':
        return Video();
      default:
        return IndexPage();
    }
  }
}
