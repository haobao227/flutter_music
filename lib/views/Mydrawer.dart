import 'package:flutter/material.dart'; //google风格的库
import 'package:flutter/cupertino.dart'; // ios风格  对苹果手机比较友好
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mydrawer extends StatefulWidget {
  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  var slideList = [
    {'icon': Icons.library_music, 'label': '听歌识曲'},
    {'icon': Icons.call_to_action, 'label': '演出'},
    {'icon': Icons.shopping_cart, 'label': '商城'},
    {'icon': Icons.edit_location, 'label': '附近的人'},
    {'icon': Icons.videogame_asset, 'label': '游戏推荐'},
    {'icon': Icons.library_music, 'label': '口袋彩铃'},
  ];
  var slideList2 = [
    {'icon': Icons.library_music, 'label': '我的订单'},
    {'icon': Icons.call_to_action, 'label': '演出'},
    {'icon': Icons.shopping_cart, 'label': '商城'},
    {'icon': Icons.edit_location, 'label': '附近的人'},
    {'icon': Icons.videogame_asset, 'label': '游戏推荐'},
    {'icon': Icons.library_music, 'label': '口袋彩铃'},
    {'icon': Icons.library_music, 'label': '口袋彩铃'},
    {'icon': Icons.library_music, 'label': '口袋彩铃'},
    {'icon': Icons.library_music, 'label': '口袋彩铃'},
    {'icon': Icons.library_music, 'label': '口袋彩铃'},
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          height: ScreenUtil().setHeight(1230),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(3.0)),
          child: ListView(
            children: <Widget>[
            _titleItem(context),
            _defaultItem(),
            Divider(),
            _slideItem(Icons.lightbulb_outline, '创作者中心'),
            Divider(),
            _sideList(slideList),
            Divider(
              height: 1,
            ),
            _sideList(slideList2)
          ])
        ),
        Positioned(
          child: bottomItem(),
          bottom: 0,
        )
      ],
    );
  }

  // 头像  昵称
  Widget _titleItem(context) {
    return Container(
        child: ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://i0.hdslb.com/bfs/article/17441cbee5924a42d5f453c4cba4733768abec81.jpg@1282w_1054h.webp'),
      ),
      title: Text('九月十六'),
    ));
  }

  // 标题栏
  Widget _defaultItem() {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _defaultIcon(Icons.mail, '我的消息'),
        ),
        Expanded(
          flex: 1,
          child: _defaultIcon(Icons.people, '我的好友'),
        ),
        Expanded(
          flex: 1,
          child: _defaultIcon(Icons.home, '个人主页'),
        ),
        Expanded(
          flex: 1,
          child: _defaultIcon(Icons.ac_unit, '个性装扮'),
        ),
      ],
    );
  }

  Widget _defaultIcon(icon, title) {
    return Column(
      children: <Widget>[
        Container(
            child: Icon(
          icon,
          color: Colors.red,
        )),
        Text(
          title,
          style: TextStyle(fontSize: ScreenUtil().setSp(25)),
        )
      ],
    );
  }

  Widget _slideItem(icon, title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        print('点击');
      },
    );
  }

  Widget _sideList(list) {
    return Container(
        height: ScreenUtil().setHeight(430),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemExtent: 40,
            itemBuilder: (BuildContext context, int index) {
              return _slideItem(list[index]['icon'], list[index]['label']);
            }));
  }

  Widget bottomItem() {
    return Container(
      width: ScreenUtil().setWidth(600),
      height: ScreenUtil().setHeight(100),
//      padding: EdgeInsets.only(left: 20,right: 20),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.brightness_2,
                  size: ScreenUtil().setSp(50),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text('夜间模式'),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.settings,
                  size: ScreenUtil().setSp(50),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text('设置'),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.exit_to_app,
                  size: ScreenUtil().setSp(50),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text('退出'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
