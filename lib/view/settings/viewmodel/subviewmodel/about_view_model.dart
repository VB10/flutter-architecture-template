part of '../settings_view_model.dart';

extension SettingsViewModelBaseNavigate on _SettingsViewModelBase {
  void navigateToContribution() {
    navigation.navigateToPage(path: NavigationConstants.SETTINGS_WEB_VIEW, data: SettingsDynamicModel.fakeArchitecturePR());
  }

  void navigateToFakeContribution() {
    navigation.navigateToPage(path: NavigationConstants.SETTINGS_WEB_VIEW, data: SettingsDynamicModel.fakeNull());
  }
}
