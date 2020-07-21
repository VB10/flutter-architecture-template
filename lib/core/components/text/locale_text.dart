import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';

class LocaleText extends StatelessWidget {
  final String value;

  const LocaleText({Key key, @required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(value.locale);
  }
}
