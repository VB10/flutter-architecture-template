import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/constants/enums/app_theme_enum.dart';
import '../../../core/extension/widget_extension.dart';
import '../../../core/init/lang/language_manager.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/notifier/theme_notifer.dart';
import '../../../product/enum/lottie_path_enum.dart';
import '../viewmodel/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SettingsViewModel viewModel) => Scaffold(
        body: Padding(
          padding: context.paddingLow,
          child: CustomScrollView(
            slivers: [
              buildSliverAppBar(context),
              buildCardUser(context, viewModel).toSliver,
              context.emptySizedHeightBoxLow.toSliver,
              buildBuildCardHeaderProjectCore(context, viewModel).toSliver,
              context.emptySizedHeightBoxLow.toSliver,
              buildCardNavigationTour(viewModel).toSliver,
              context.emptySizedHeightBoxLow.toSliver,
              buildCardAbout(context, viewModel).toSliver,
              context.emptySizedHeightBoxNormal.toSliver,
              Text(
                '${''.version}',
                textAlign: TextAlign.center,
                style: context.textTheme.headline6?.copyWith(fontWeight: FontWeight.w100),
              ).toSliver,
              context.emptySizedHeightBoxNormal.toSliver,
              buildTextButtonLogOut(context, viewModel).toSliver,
            ],
          ),
        ),
      ),
    );
  }

  Card buildCardNavigationTour(SettingsViewModel viewModel) {
    return Card(
        child: ListTile(
      onTap: viewModel.navigateToOnBoard,
      title: Text(LocaleKeys.home_setting_applicationTour.tr()),
      trailing: Icon(Icons.arrow_right),
    ));
  }

  TextButton buildTextButtonLogOut(BuildContext context, SettingsViewModel viewModel) {
    return TextButton.icon(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder()),
            padding: MaterialStateProperty.all(context.paddingNormal),
            backgroundColor: MaterialStateProperty.all(context.colorScheme.onError.withOpacity(0.7))),
        onPressed: viewModel.logutApp,
        icon: Icon(Icons.exit_to_app),
        label: Text(LocaleKeys.home_setting_exit.tr()));
  }

  Widget buildBuildCardHeaderProjectCore(BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel, title: LocaleKeys.home_setting_core_title, children: [
      ListTile(
        title: Text(LocaleKeys.home_setting_core_themeTitle.tr()),
        trailing: IconButton(
            icon: context.watch<ThemeNotifier>().currenThemeEnum == AppThemes.LIGHT ? LottiePathEnum.MOON.toWidget : LottiePathEnum.SUNNY.toWidget,
            onPressed: viewModel.changeAppTheme),
        subtitle: Text(LocaleKeys.home_setting_core_themeDesc),
      ),
      ListTile(
        title: Text(LocaleKeys.home_setting_core_langTitle.tr()),
        trailing: Observer(builder: (_) {
          return DropdownButton<Locale>(items: [
            DropdownMenuItem(child: Text(LanguageManager.instance.trLocale.countryCode!.toUpperCase()), value: LanguageManager.instance.trLocale),
            DropdownMenuItem(child: Text(LanguageManager.instance.enLocale.countryCode!.toUpperCase()), value: LanguageManager.instance.enLocale),
          ], onChanged: viewModel.changeAppLocalization, value: viewModel.appLocale);
        }),
        subtitle: Text(LocaleKeys.home_setting_core_langDesc.tr()),
      ),
    ]);
  }

  Widget buildCardHeader(BuildContext context, SettingsViewModel viewModel, {required String title, required List<Widget> children}) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Padding(padding: context.paddingLow, child: Text(title.tr(), style: context.textTheme.headline5)), Divider(), ...children],
      ),
    );
  }

  Widget buildCardAbout(BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel, title: LocaleKeys.home_setting_about_title, children: [
      ListTile(
        onTap: viewModel.navigateToContribution,
        leading: Icon(Icons.favorite),
        title: Text(LocaleKeys.home_setting_about_contribitions.tr()),
        trailing: Icon(Icons.keyboard_arrow_right_outlined),
      ),
      ListTile(
        onTap: viewModel.navigateToFakeContribution,
        leading: Icon(Icons.home),
        title: Text('Home Page'),
        trailing: Icon(Icons.keyboard_arrow_right_outlined),
      )
    ]);
  }

  Card buildCardUser(BuildContext context, SettingsViewModel viewModel) {
    return Card(
      child: Padding(
        padding: context.paddingLow,
        child: Row(
          children: [
            CircleAvatar(child: Text(viewModel.userModel.shortName), radius: 30),
            Spacer(),
            Text(viewModel.userModel.fullName),
            Spacer(flex: 5),
          ],
        ),
      ),
    );
  }

  NestedScrollView buildNestedScrollView() {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [buildSliverAppBar(context)];
        },
        body: Column());
  }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      backgroundColor: context.colorScheme.background,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text(
          LocaleKeys.home_setting_title.tr(),
          style: context.textTheme.headline5,
        ),
      ),
    );
  }
}
