import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight _instace;
  static ColorSchemeLight get instance {
    if (_instace == null) _instace = ColorSchemeLight._init();
    return _instace;
  }

  ColorSchemeLight._init();

  final Color brown = Color(0xffa87e6f);
  final Color red = Color(0xffc10e0e);
  final Color white = Color(0xffffffff);
  final Color gray = Color(0xffa5a6ae);
  final Color lightGray = Color(0xfff7f7f7);
  final Color darkGray = Color(0xff676870);
  final Color black = Color(0xff020306);

  final Color azure = Color(0xff27928d);
}
