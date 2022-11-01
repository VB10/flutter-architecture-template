import 'package:architecture_widgets/src/decoration/circle_decoration.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';

class DecorationHelper {
  DecorationHelper({
    this.context,
  });
  BuildContext? context;

  Decoration get circleDecoriaton =>
      CircleDecoration(color: context!.colors.surface, radius: 3);
}
