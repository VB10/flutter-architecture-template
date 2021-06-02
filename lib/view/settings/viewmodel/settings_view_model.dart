import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/lang/language_manager.dart';
import '../../../core/init/notifier/theme_notifer.dart';
import '../../../product/model/user.dart';
import '../model/settings_dynamic.dart';

part 'settings_view_model.g.dart';
part 'subviewmodel/about_view_model.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  final userModel = UserModel.fake();
  @override
  void setContext(BuildContext context) => this.context = context;

  @observable
  Locale? appLocale = LanguageManager.instance.enLocale;

  @override
  void init() {}

  void changeAppTheme() {
    if (context != null) {
      context!.read<ThemeNotifier>().changeTheme();
    }
  }

  @action
  void changeAppLocalization(Locale? locale) {
    if (locale != null) {
      appLocale = locale;
      context?.setLocale(locale);
    }
  }

  Future<void> logutApp() async {
    await localeManager.clearAllSaveFirst();
    await navigation.navigateToPageClear(path: NavigationConstants.TEST_VIEW);
  }

  Future<void> navigateToOnBoard() async {
    await navigation.navigateToPage(path: NavigationConstants.ON_BOARD);
  }
}
