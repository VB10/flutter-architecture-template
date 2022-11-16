import 'dart:math';

import 'package:flutter/material.dart';

class RandomColorContainer extends StatelessWidget {
  const RandomColorContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: Colors.primaries[Random().nextInt(17)]);
  }
}
