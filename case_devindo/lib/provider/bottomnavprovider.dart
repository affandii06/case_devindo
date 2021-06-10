import 'package:case_devindo/view/home.dart';
import 'package:case_devindo/view/search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomnavProvider with ChangeNotifier{

  int _selected = 0;
  double width1 = 120;
  double width2 = 50;

  Color coloricon1 = Colors.white;
  Color coloricon2 = Colors.black;

  Color colorcont1 = Colors.blue;
  Color colorcont2 = Colors.white;

  bool visible1 = true;
  bool visible2 = false;

  List _page = [
    Home(),
    Search()
  ];

  get page =>_page[_selected];
  get selected => _selected;

  set selected (int value){
    _selected = value;
    if(_selected == 0){
      width1 = 120;
      width2 = 50;

      coloricon1 = Colors.white;
      coloricon2 = Colors.black;

      colorcont1 = Colors.blue;
      colorcont2 = Colors.white;

      notifyListeners();
    }
    if(_selected == 1){
      width1 = 50;
      width2 = 120;

      coloricon1 = Colors.black;
      coloricon2 = Colors.white;

      colorcont1 = Colors.white;
      colorcont2 = Colors.blue;

      notifyListeners();
    }

    notifyListeners();
  }
}