import 'dart:math';

import 'package:flutter/material.dart';

class RandomColorContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.primaries[Random().nextInt(17)]);
  }
}
