import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext context;

  void setContext(BuildContext context);
  void init();
}
