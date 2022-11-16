import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';

class AutoLocaleText extends StatelessWidget {
  const AutoLocaleText({Key? key, required this.value, this.textAlign, this.style})
      : super(
          key: key,
        );
  final String value;
  final TextAlign? textAlign;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      value.locale,
      textAlign: textAlign,
      style: style,
    );
  }
}
