import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/view/_product/_utilty/burger_network_enum.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/service/splash_service.dart';
import 'package:fluttermvvmtemplate/view/home/burger/service/burger_serivce.dart';

void main() {
  ISplashService? splashService;
  setUp(() {
    splashService = SplashService(VexanaManager.instance.networkManager);
  });
  test('Fetch favorite Burgers', () async {
    final response = await splashService?.checkDeviceVersion(
        version: "0.0.9", platform: "1");

    expect(response, isNotEmpty);
  });
}
