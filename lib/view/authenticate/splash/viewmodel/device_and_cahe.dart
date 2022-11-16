import 'package:fluttermvvmtemplate/core/init/cache/locale_manager.dart';
import 'package:kartal/kartal.dart';

mixin DeviceAndCache {
  Future<void> deviceandCacheInit() async {
    await Future.wait([
      LocaleManager.prefrencesInit(),
      DeviceUtility.instance.initPackageInfo(),
    ]);
  }
}
