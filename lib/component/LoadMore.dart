import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadMore extends StatelessWidget {
  bool loading = false;
  String text;
  LoadMore(this.loading, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          loading
              ? SizedBox(
                  width: ScreenUtil().setWidth(16),
                  height: ScreenUtil().setHeight(16),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : Container(),
          loading
              ? Padding(
                  padding: EdgeInsets.only(left: 10),
                )
              : Container(),
          Text(text == null ? '加载中...' : text),
        ],
      ),
    );
  }
}
