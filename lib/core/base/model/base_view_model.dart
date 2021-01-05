import 'package:flutter/material.dart';

import '../../init/cache/locale_manager.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/ICoreDio.dart';
import '../../init/network/network_manager.dart';
import '../../init/network/vexana_manager.dart';

abstract class BaseViewModel {
  BuildContext context;

  ICoreDio coreDio = NetworkManager.instance.coreDio;
  VexanaManager vexanaManager = VexanaManager.instance;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}
