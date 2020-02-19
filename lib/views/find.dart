import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart'; //google风格的库
import 'package:flutter/cupertino.dart'; // ios风格  对苹果手机比较友好
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../utils/request.dart';
import 'package:weui/weui.dart';

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
          HomeSwiper()
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
class _HomeSwiperState extends State<HomeSwiper> {
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
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image:  DecorationImage(
                      image:NetworkImage(swiperDateList[index]['pic']),
                      fit: BoxFit.fill
                    ),
                  ),
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
