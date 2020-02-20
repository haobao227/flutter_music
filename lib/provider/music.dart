import 'package:flutter/material.dart';


class Music with ChangeNotifier {

  int songsId = 0;

  setSongsId(int a) {
    songsId = a;
    notifyListeners();
  }

  get SongsId => songsId;

}