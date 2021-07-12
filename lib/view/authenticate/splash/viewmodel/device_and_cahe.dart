import 'package:kartal/kartal.dart';

import '../../../../core/init/cache/locale_manager.dart';

mixin DeviceAndCache {
  Future<void> deviceandCacheInit() async {
    if (DeviceUtility.instance == null) {
      return;
    }
    await Future.wait([
      LocaleManager.prefrencesInit(),
      DeviceUtility.instance!.initPackageInfo()
    ]);
  }
}
