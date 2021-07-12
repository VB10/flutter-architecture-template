import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/constants/navigation/navigation_constants.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../product/enum/platform_project.dart';
import '../model/force_update_model.dart';
import '../service/splash_service.dart';
import 'device_and_cahe.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel, DeviceAndCache {
  @override
  void setContext(BuildContext context) => this.context = context;

  @observable
  bool isFirstInit = true;

  ISplashService? service;

  @override
  void init() {
    startAnimationOnView();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      controlAppState();
    });

    // Dummy for moduler page
    Future.delayed(Duration(seconds: 1)).then((value) {
      navigation.navigateToPage(path: NavigationConstants.BUY_VIEW);
    });
  }

  Future<void> controlAppState() async {
    await deviceandCacheInit();
    // MARK: CONCURENCY sample
    final data = await compute(_UserVersionCreate.createNumber, 1);
    print(data);
    _networkInit();
    final isNeedForceUpdate = await _checkAppVersion();
    if (isNeedForceUpdate) {
      showAboutDialog(context: context!, children: [Text('Neeed to Update')]);
    } else {
      // await navigation.navigateToPageClear(path: NavigationConstants.TEST_VIEW);
    }
  }

  void _networkInit() {
    if (vexanaManager != null) {
      service = SplashService(vexanaManagerComputed.networkManager);
    }
  }

  Future<bool> _checkAppVersion() async {
    final response = await service?.checkDeviceVersion(
        version: ''.version, platform: '${PlatformProject.IOS.versionNumber}');

    if (response is ForceUpdateModel) {
      return response.isForceUpdate ?? false;
    } else {
      return false;
    }
  }

  Future<void> startAnimationOnView() async {
    if (context == null) return;
    await Future.delayed(context!.durationLow);
    _changeFirstInit();
  }

  @action
  void _changeFirstInit() {
    isFirstInit = !isFirstInit;
  }
}

class _UserVersionCreate {
  static String createNumber(int number) {
    var model = ForceUpdateModel(currentVersion: '1.0.3');
    final data = jsonEncode(model);
    final lastData = jsonDecode(data);

    return ForceUpdateModel().fromJson(lastData).currentVersion ?? '';
  }
}
