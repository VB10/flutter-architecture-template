import 'package:flutter/cupertino.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/model/force_update_model.dart';
import 'package:vexana/vexana.dart';

abstract class ISplashService {
  final INetworkManager networkManager;

  ISplashService(this.networkManager);

  Future<ForceUpdateModel?> checkDeviceVersion(
      {required String version, required String platform});
}

enum SplashServiceQuery { VERSION, PLATFORM }

extension SplashServiceQueryExtension on SplashServiceQuery {
  MapEntry<String, String> toMapValue(String value) {
    switch (this) {
      case SplashServiceQuery.PLATFORM:
        return MapEntry('platform', value);
      case SplashServiceQuery.VERSION:
        return MapEntry('version', value);
    }
  }
}

class SplashService extends ISplashService {
  final String _path = 'version';
  SplashService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<ForceUpdateModel?> checkDeviceVersion(
      {required String version, required String platform}) async {
    final response =
        await networkManager.send<ForceUpdateModel, ForceUpdateModel>(
      _path,
      parseModel: ForceUpdateModel(),
      method: RequestType.GET,
      queryParameters: Map.fromEntries([
        SplashServiceQuery.VERSION.toMapValue(version),
        SplashServiceQuery.PLATFORM.toMapValue(platform)
      ]),
    );
    return response.data;
  }
}
