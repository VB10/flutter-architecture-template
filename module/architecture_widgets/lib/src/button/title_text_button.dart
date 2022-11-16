import 'package:architecture_widgets/src/button/normal_button.dart';
import 'package:flutter/material.dart';

class TitleTextButton extends StatelessWidget {
  const TitleTextButton({Key? key, this.onPressed, required this.text})
      : super(
          key: key,
        );
  final VoidCallback? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
