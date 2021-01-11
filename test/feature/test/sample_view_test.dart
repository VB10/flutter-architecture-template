import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/init/network/ICoreDio.dart';
import 'package:fluttermvvmtemplate/core/init/network/network_manager.dart';

main() {
  setUp(() {
    final _ = NetworkManager.instance.coreDio;
  });
  test("Sample", () {});
}
