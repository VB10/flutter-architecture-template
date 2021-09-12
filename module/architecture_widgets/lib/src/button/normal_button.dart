import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final Widget? child;

  final VoidCallback? onPressed;

  const NormalButton({Key? key, this.child, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
        elevation: MaterialStateProperty.all(10),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

// BEFORE: NULL SAFETY
//  return RaisedButton(
//       padding: EdgeInsets.all(15),
//       elevation: 10,
//       onPressed: onPressed,
//       child: child,
//     );
