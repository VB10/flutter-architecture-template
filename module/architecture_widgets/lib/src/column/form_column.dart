import 'package:flutter/material.dart';

class FormColumn extends StatelessWidget {
  const FormColumn({Key? key, this.children}) : super(key: key);
  final List<Widget>? children;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Spacer(),
        Expanded(
          flex: 8,
          child: Column(
            children: children!,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
