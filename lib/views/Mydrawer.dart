import 'package:flutter/material.dart';  //google风格的库
import 'package:flutter/cupertino.dart';  // ios风格  对苹果手机比较友好
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mydrawer extends StatefulWidget {
  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {

  var slideList = [
    { 'icon': Icons.library_music, 'label': '听歌识曲'},
    { 'icon': Icons.library_music, 'label': '听歌识曲'},
    { 'icon': Icons.library_music, 'label': '听歌识曲'},
    { 'icon': Icons.library_music, 'label': '听歌识曲'},
    { 'icon': Icons.library_music, 'label': '听歌识曲'},
    { 'icon': Icons.library_music, 'label': '听歌识曲'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.0)
      ),
      child: Column(
        children: <Widget>[
          _titleItem(context),
          _defaultItem()

        ],
      )
    );
  }
  // 头像  昵称
  Widget _titleItem(context) {
     return Container(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://i0.hdslb.com/bfs/article/17441cbee5924a42d5f453c4cba4733768abec81.jpg@1282w_1054h.webp'),
          ),
          title: Text('九月十六'),
        )
     );
  }

  // 标题栏
  Widget _defaultItem(){
    return Flex(
     direction: Axis.horizontal,
     children: <Widget>[
       Expanded(
         flex: 1,
         child: _defaultIcon(Icons.mail,'我的消息'),
       ),
       Expanded(
         flex: 1,
         child: _defaultIcon(Icons.people,'我的好友'),
       ),
       Expanded(
         flex: 1,
         child: _defaultIcon(Icons.home,'个人主页'),
       ),
       Expanded(
         flex: 1,
         child: _defaultIcon(Icons.ac_unit,'个性装扮'),
       ),
     ],
    );
  }
  Widget _defaultIcon(icon, title){
    return Column(
      children: <Widget>[
         Container(
           child: Icon(icon,color: Colors.red,)
         ),
         Text(
           title,
           style: TextStyle(
            fontSize: ScreenUtil().setSp(25)
           ),
         )
      ],
    );
  }
}
