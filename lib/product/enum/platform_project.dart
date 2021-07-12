import 'dart:io';

enum PlatformProject { ANDROID, IOS }

extension PlatformProjectExtension on PlatformProject {
  int get versionNumber {
    return Platform.isIOS
        ? PlatformProject.IOS.index
        : PlatformProject.ANDROID.index;
  }
}
