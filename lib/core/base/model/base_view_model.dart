import 'package:flutter/material.dart';

import 'package:fluttermvvmtemplate/core/init/cache/locale_manager.dart';
import 'package:fluttermvvmtemplate/core/init/navigation/navigation_service.dart';
import 'package:fluttermvvmtemplate/core/init/network/ICoreDio.dart';
import 'package:fluttermvvmtemplate/core/init/network/network_manager.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';

abstract class BaseViewModel {
  late BuildContext viewModelContext;

  ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;
  VexanaManager? vexanaManager = VexanaManager.instance;

  VexanaManager get vexanaManagerComputed => VexanaManager.instance;

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}
