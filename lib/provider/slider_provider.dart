import 'package:flutter/foundation.dart';



class SliderProvider with ChangeNotifier {
  double _svalue = 0.5;
  double get svalue => _svalue; 


  void setValue (val){
    _svalue = val;
    notifyListeners();
  }

}