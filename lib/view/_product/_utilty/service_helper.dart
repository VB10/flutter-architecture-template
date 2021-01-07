import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

abstract class ServiceHelper {
  void showMessage(GlobalKey<ScaffoldState> scaffoldKey, IErrorModel errorModel) {
    if (scaffoldKey == null || errorModel == null) return;
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(errorModel.description ?? errorModel.statusCode.toString())));
  }
}
