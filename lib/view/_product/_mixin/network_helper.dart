import 'package:logger/logger.dart';

mixin NetworkHelper {
  void showLog(dynamic message) {
    Logger().wtf(message);
  }
}
