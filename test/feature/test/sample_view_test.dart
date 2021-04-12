import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/init/network/network_manager.dart';

Future<void> main() async {
  setUp(() {
    final _ = NetworkManager.instance.coreDio;
  });
  test('Sample', () {});
}
