import 'package:architecture_widgets/src/button/normal_button.dart';
import 'package:flutter/material.dart';

class IconNormalButton extends StatelessWidget {
  const IconNormalButton({Key? key, this.onPressed, required this.icon})
      : super(
          key: key,
        );
  final VoidCallback? onPressed;
  final IconData icon;
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
