import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ThemeProvider with ChangeNotifier{
  Brightness _brightness = Brightness.light;
  void setBrightness(Brightness brightness){
    _brightness = brightness;
    notifyListeners();
  }
  Brightness get brightnessOfApp => _brightness;

}