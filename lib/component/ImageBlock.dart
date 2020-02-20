import 'package:flutter/material.dart'; //google风格的库
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ios风格  对苹果手机比较友好
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provide/provide.dart';
import '../utils/CommonMethods.dart';

import '../provider/music.dart';
import 'package:provide/provide.dart';


class ImageBlock extends StatelessWidget {
  final item;
  ImageBlock(this.item);
  @override
  Widget build(BuildContext context) {
    return Provide<Music>(
      builder: (context, child, val){
         return Container(
           width: ScreenUtil().setWidth(200),
           margin: EdgeInsets.only(right: 10),
           child: Align(
               child: Stack(
                 children: <Widget>[
                   Column(
                     children: <Widget>[
                       InkWell(
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(5),
                           child: CachedNetworkImage(
                             fit: BoxFit.cover,
                             imageUrl: item['picUrl'],
                             placeholder: (context, url) => CircularProgressIndicator(
                               // backgroundColor: Colors.pink,
                             ),
                             errorWidget: (context, url, error) => Icon(Icons.error),
                           ),
                         ),
                         onTap: () {
                           print('${item['id']}');
                           // 记录当前歌单的id
                           Provide.value<Music>(context).setSongsId(item['id']);
                           Navigator.of(context).pushNamed('/dayPush');
                         },
                       ),
                       Container(
                         child: Text(
                           item['name'],
                           maxLines: 2,
                           overflow: TextOverflow.ellipsis,
                           style: TextStyle(fontSize: ScreenUtil().setSp(25)),
                         ),
                       )
                     ],
                   ),
                   Positioned(
                     width: ScreenUtil().setWidth(100), // 一定要写宽度  要不然嘎嘎报错 !!!
                     child: Container(
                         child: Row(
                           children: <Widget>[
                             Icon(
                               Icons.play_arrow,
                               color: Colors.white,
                               size: 15,
                             ),
                             Text(
                               convertNumber(item['playCount']),
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                   fontSize: ScreenUtil().setSp(15), color: Colors.white),
                             ),
                           ],
                         )),
                     top: 0,
                     right: 0,
                   )
                 ],
               )),
         );
      },
    );
  }
}
