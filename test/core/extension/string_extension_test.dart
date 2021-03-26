import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';

Future<void> main() async {
  setUp(() {});
  test('Email Regexp', () {
    var email = 'joedoe@gmail.com';
    expect(email.isValidEmail, null);
  });
}
