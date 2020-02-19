import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart'; //google风格的库
import 'package:flutter/cupertino.dart'; // ios风格  对苹果手机比较友好
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../utils/request.dart';
import 'package:weui/weui.dart';
import '../component/CommonContainer.dart';
import '../component/ImageBlock.dart';

class Find extends StatefulWidget {
  @override
  _FindState createState() => _FindState();
}

class _FindState extends State<Find> {
  bool get wantKeepAlive => true; // 保持页面状态
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(left: 15, right: 15),
      child: ListView(
        children: <Widget>[
          HomeSwiper(),
          RecommendList(),
          RecommendSongsList()
        ],
      ),
    );
  }
}

// 轮播图
class HomeSwiper extends StatefulWidget {
  @override
  _HomeSwiperState createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper>{
  var swiperDateList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSwiperList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(215),
      width: ScreenUtil().setWidth(750),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: EdgeInsets.only(top: 8),
      child: swiperDateList.length > 0
          ? Swiper(
              itemCount: swiperDateList.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: NetworkImage(swiperDateList[index]['pic']),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 3,bottom: 3,left: 5,right: 5),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Text(
                              swiperDateList[index]['typeTitle'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(25)
                              ),
                            )))
                  ],
                );
              },
              pagination: new SwiperPagination(),
              autoplay: true,
            )
          : Container(
              height: ScreenUtil().setHeight(270),
              child: WeSpin(
                isShow: true,
                tip: Text('加载中...'),
              ),
            ),
    );
  }

  Future getSwiperList() async {
    request('get', '/banner', {'type': 1}).then((res) {
      setState(() {
        swiperDateList = res['banners'];
      });
    });
  }
}

// 推荐列表
class RecommendList extends StatelessWidget {
  final btns = [
    {
      'name': '每日推荐',
      'icon': const Icon(
        Icons.calendar_today,
        color: Colors.white,
      )
    },
    {
      'name': '歌单',
      'icon': const Icon(
        Icons.receipt,
        color: Colors.white,
      )
    },
    {
      'name': '排行榜',
      'icon': const Icon(
        Icons.trending_up,
        color: Colors.white,
      )
    },
    {
      'name': '电台',
      'icon': const Icon(
        Icons.radio,
        color: Colors.white,
      )
    },
    {
      'name': '直播',
      'icon': const Icon(
        Icons.tv,
        color: Colors.white,
      )
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(120),
      margin: EdgeInsets.only(top: 8),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        children: btns.map((v) {
          return _gridItem(v);
        }).toList(),
      ),
    );
  }

  Widget _gridItem(item) {
    return InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: ClipOval(
                  child: item['icon']
              ),
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setHeight(80),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
            Text(
              item['name'],
              style: TextStyle(fontSize: ScreenUtil().setSp(25)),
            )
          ],
        ));
  }
}

//推荐歌单

class RecommendSongsList extends StatefulWidget {
  @override
  _RecommendSongsListState createState() => _RecommendSongsListState();
}

class _RecommendSongsListState extends State<RecommendSongsList> {
  var result = [];
  final limit = 6;   // 一次只获取6条

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecommendSongsList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[
          CommonContainer(title:'推荐歌单',anotherTitle: '为你精挑细选', buttonText: '查看更多', icon: null),
          result.length > 0 ? Container(
            width: ScreenUtil().setWidth(1000),
            height: ScreenUtil().setHeight(270),
            margin: EdgeInsets.only(top: 1),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: result.map((v) {
                return ImageBlock(v);
              }).toList(),
            ),
          ): Container(
            height: ScreenUtil().setHeight(250),
            child: WeSpin(
              isShow: true,
              tip: Text('加载中...'),
            ),
          ),
        ],
      ),
    );
  }

  Future getRecommendSongsList() async {
    request('get', '/personalized', {'limit': limit}).then((res) {
      print(res);
      setState(() {
        result = res['result'];
      });

    });
  }

}


