import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // ios风格  对苹果手机比较友好
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_demo/provider/music.dart';
import 'package:provide/provide.dart';
import '../utils/request.dart';
import 'package:weui/weui.dart';
import '../component/LoadMore.dart';

class DayPushPage extends StatefulWidget {
  @override
  _DayPushPageState createState() => _DayPushPageState();
}

class _DayPushPageState extends State<DayPushPage> {


  var tracks = [];  //歌曲列表
  var playList = {};  // 返回的对象;
  bool _isLoading = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    不要在只会调用一次的组件生命周期中调用Provider,比如如下的使用方法是错误的
//    print(Provide.value<Music>(context).songsId);
//    getPlayList(id);
  }

  // initState => didChangeDependencies
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    var id = Provide.value<Music>(context).songsId;
    print(id);
    getPlayList(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
           child: CustomScrollView(
             slivers: <Widget>[
               SliverAppBar(
                 elevation: 0, //阴影
                 pinned: true, //是否固定在顶部
                 brightness: Brightness.dark, //主题明亮
                 backgroundColor: Theme.of(context).accentColor,
                 expandedHeight: ScreenUtil().setHeight(450), //展开高速,
                 iconTheme: IconThemeData(color: Colors.white),
                 title: Text(
                   "歌单列表",
                   style: TextStyle(color: Colors.white),
                 ),
                 flexibleSpace: FlexibleSpaceBar(
                   title: Text(
                     "每日推荐",
                     style: TextStyle(color: Colors.white),
                   ),
                   collapseMode: CollapseMode.pin,
                   background: tracks.length > 0? Stack(
                     children: <Widget>[
                       CachedNetworkImage(
                         width: ScreenUtil().setWidth(750),
                         fit: BoxFit.cover,
                         imageUrl: playList['coverImgUrl'],
                         placeholder: (context, url) => CircularProgressIndicator(),
                       ),
                       Padding(
                         padding: EdgeInsets.only(
                           top: 100.0,
                           left: 16.0,
                         ),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.end,
                           children: <Widget>[
                             Text(
                               DateTime.now().day.toString(),
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 34,
                               ),
                             ),
                             Padding(
                               padding: EdgeInsets.only(left: 3.0),
                             ),
                             Text(
                               '/',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 18,
                               ),
                             ),
                             Padding(
                               padding: EdgeInsets.only(left: 3.0),
                             ),
                             Text(
                               DateTime.now().month.toString(),
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 18,
                               ),
                             ),
                           ],
                         ),
                       )
                     ],
                   ):
                       Container()
                 ),
                 bottom: PreferredSize(
                   preferredSize: Size.fromHeight(48),
                   child: Container(
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: NetworkImage(
                           tracks.length > 0? tracks[0]['al']['picUrl'] : ''
                         ),
                         fit: BoxFit.fill
                       )
                     ),
                     child: ClipRRect(
                       borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(20),
                         topRight: Radius.circular(20),
                       ),
                       child: Container(
                         padding: EdgeInsets.all(16),
                         color: Colors.white,
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: <Widget>[
                             Container(
                               child: Icon(Icons.play_circle_outline),
                             ),
                             Padding(
                               padding: EdgeInsets.only(left: 12),
                             ),
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.end,
                               children: <Widget>[
                                 Text('播放全部'),
                                 Text(
                                   '（共${tracks.length}首）',
                                   style: TextStyle(
                                     fontSize: 12.0,
                                     color: Color(0xff999999),
                                   ),
                                 ),
                               ],
                             )
                           ],
                         ),
                         
                       ),
                     ),
                   ),
                 ),
               ),
               SliverList(
                 delegate: SliverChildBuilderDelegate((context, index){
                   final item = tracks[index];
                   return ListTile(
                     onTap:() async{},
                     title: Container(
                       child: Row(
                         children: <Widget>[
                           Container(
                             padding: EdgeInsets.only(right: 10.0),
                             alignment: Alignment.centerLeft,
                             child: ClipRRect(
                               child: CachedNetworkImage(
                                 height: 40.0,
                                 width: 40.0,
                                 fit: BoxFit.cover,
                                 imageUrl: item['al']['picUrl'],
                                 placeholder: (context, url) =>
                                     CircularProgressIndicator(),
                               ),
                             ),
                           ),
                           Expanded(
                             flex: 1,
                             child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    tracks[index]['name'],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      tracks[index]['ar'][0]['name'],
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xff666666),
                                      ),
                                    ),
                                  ),
                                ],
                             ),
                           ),
                           InkWell(
                             onTap: (){},
                             child: Icon(
                               Icons.ondemand_video,
                               color: Color(0xff999999),
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.only(left: 15),
                           ),
//                           InkWell(
//                             onTap: (){},
//                             child: null,
//                           )
                         ],
                       ),
                     )
                   );
                 },
                   childCount: tracks.length,
                 ),
               ),
               SliverToBoxAdapter(
                 child:
                 LoadMore(_isLoading, _isLoading? '加载中...' : '没有更多啦!'),
               )
             ],
           ),
          )
        ],
      )
    );
  }



  Future getPlayList(int id) async{
    request('get', '/playlist/detail', {'id': id}).then((res){
      print(res);
      setState(() {
        playList = res['playlist'];
        tracks = res['playlist']['tracks'];
      });
    });
  }
}
