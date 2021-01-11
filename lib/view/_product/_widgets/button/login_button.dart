import 'package:flutter/material.dart';

import '../../../../core/components/button/icon_button.dart';

class MVVMLoginButton extends StatelessWidget {
  final Function(String data) onComplete;

  const MVVMLoginButton({Key key, this.onComplete}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconNormalButton(
      icon: Icons.access_alarm,
      onPressed: () {
        onComplete("OKEY");
        //  BUSINESS CALL
      },
    );
  }
}
