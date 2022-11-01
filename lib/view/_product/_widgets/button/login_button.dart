import 'package:architecture_widgets/src/button/icon_button.dart';
import 'package:flutter/material.dart';

class MVVMLoginButton extends StatelessWidget {

  const MVVMLoginButton({Key? key, this.onComplete}) : super(key: key);
  final Function(String data)? onComplete;
  @override
  Widget build(BuildContext context) {
    return IconNormalButton(
      icon: Icons.access_alarm,
      onPressed: () {
        onComplete!('OKEY');
        //  BUSINESS CALL
      },
    );
  }
}
