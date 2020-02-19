import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
const Api= 'http://116.196.112.242:3000';

Future request(type, url, formData)async{
  try{
    print('开始获取数据...............');
    Response response;
    Dio dio = new Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();


    var cookies = prefs.getString('token');
    Map<String, dynamic> headers = new Map();
    headers['Cookie'] = cookies == null? '': (cookies.toString());
    Options options = new Options(headers: headers);

    dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
    print('请求的url: ' + Api+url);
    print('请求的参数: ');
    print(formData);

    switch(type){
      case 'get':
        response = await dio.get(Api+url, queryParameters: formData, options: options);
        break;
      case 'post':
        response = await dio.post(Api+url, data: formData, options: options);
        break;
      default:
        response = await dio.get(Api+url, queryParameters: formData, options: options);
    }
    if(response.statusCode==200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>${e}');
  }

}


//class DioUtil {
//
//  static DioUtil _instance;
//
//  static DioUtil getInstance() {
//    if(_instance == null) {
//      return DioUtil();
//    }
//      return _instance;
//  }
//  Dio dio  = new Dio();
//
//  DioUtil(){
//
////    dio.options.baseUrl = 'http:116.196.112.242:3000';
//    dio.options.connectTimeout = 7000;  // 7s
//    dio.options.receiveTimeout = 7000;
//    dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
//  }
//
//  Future request(type, url, formData)async{
//    try{
//      print('开始获取数据...............');
//      switch(type){
//        case 'get':
//          return await dio.get(Url+url, queryParameters:  formData);
//        case 'post':
//          return await dio.post(Url+url, data: formData);
//        default:
//          return await dio.get(Url+url, queryParameters:  formData);
//      }
//    }catch(e){
//      return print('ERROR:======>${e}');
//    }
//  }
//
//
//}