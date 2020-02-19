import 'package:flutter/material.dart'; //google风格的库
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ios风格  对苹果手机比较友好

class CommonContainer extends StatelessWidget {
  final String title; //标题
  final String anotherTitle; // 小标题
  final String buttonText; //按钮蚊子
  final IconData icon; //图标

  CommonContainer({this.title, this.anotherTitle, this.buttonText, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(30),
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                anotherTitle,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(40),
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              icon != null
                  ? FlatButton.icon(
                      icon: Icon(icon),
                      color: Colors.white,
                      splashColor: Colors.grey,
                      label: Text(buttonText,style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                      onPressed: () {},
                    )
                  : Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 3,bottom: 3,left: 8,right: 8),
                      height: ScreenUtil().setHeight(45),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all( color: Color(0xFFdddddd), width: 0.5),
                        borderRadius: BorderRadius.circular((20.0))
                      ),
                      child: InkWell(
                        child: Text(buttonText,style: TextStyle(fontSize: ScreenUtil().setSp(25)),textAlign: TextAlign.center,),
                        onTap: (){},
                      )
              )
            ],
          )
        ],
      ),
    );
  }
}
