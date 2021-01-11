import 'package:flutter/material.dart';

import 'normal_button.dart';

class IconNormalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const IconNormalButton({Key key, this.onPressed, @required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Center(
        child: Icon(icon),
      ),
    );
  }
}
