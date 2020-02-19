import 'package:flutter/material.dart';


convertNumber(int number) {

   var str = number.toString();
   var length = str.length;
   if(length == 10) {
     return str[0] + str[1] + '.' + str[2] + '亿';
   } else if(length == 9 ) {
     return str[0] + '.' + str[1] + '亿';
   } else if(length == 8) {
     return str[0] + str[1] + str[2] + str[3]+ '万';
   } else if(length == 7) {
     return str[0] + str[1] + str[2] + '万';
   } else if(length == 6) {
     return str[0] + str[1] + '万';
   } else if(length == 5) {
     return str[0] + '万';
   } else {
     return str;
   }

}