import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum LottiePathEnum { SUNNY, MOON }

extension LottiePathEnumExtension on LottiePathEnum {
  String get rawValue {
    switch (this) {
      case LottiePathEnum.MOON:
        return _pathValue('moon');

      case LottiePathEnum.SUNNY:
        return _pathValue('sunny');
    }
  }

  Widget get toWidget {
    return Lottie.asset(rawValue);
  }

  String _pathValue(String path) => 'asset/lottie/$path.json';
}
