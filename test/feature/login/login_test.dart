import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_error.dart';

main() {
  setUp(() {
    print('Here');
  });

  test('User Login Fail Test', () {
    final isUserLogin = true;

    expect(isUserLogin, isTrue);
  });

  group('User Login Full Test', () {
    //MARK: test3
    test('User Login Fail Test', () {
      final isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    //MARK: test3
    test('User Login Fail Test', () {
      final isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    //MARK: test3
    test('User Login Fail Test', () {
      final isUserLogin = true;
      expect(isUserLogin, isTrue);
    });

    test('dynamic parse', () async {
      final error = BaseError('aaa');
      final errorDynamic = error as dynamic;

      // final errorDynamic2 = errorDynamic as TestModel;

      expect(errorDynamic, isNotNull);
    });
  });
}
