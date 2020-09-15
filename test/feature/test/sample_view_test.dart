import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/init/network/ICoreDio.dart';
import 'package:fluttermvvmtemplate/core/init/network/network_manager.dart';

main() {
  ICoreDio coreDio;
  setUp(() {
    coreDio = NetworkManager.instance.coreDio;
  });
  test("Sample", () {});
}
