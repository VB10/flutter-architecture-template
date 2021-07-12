import 'package:flutter/material.dart';

import 'package:architecture_widgets/src/decoration/circle_decoration.dart';
import '../../../core/extension/context_extension.dart';

class DecorationHelper {
  BuildContext? context;
  DecorationHelper({
    this.context,
  });

  Decoration get circleDecoriaton =>
      CircleDecoration(color: context!.colors.surface, radius: 3);
}
