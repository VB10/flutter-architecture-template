import 'package:all_of_template/features/buy_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/view/splash_view.dart';

import '../../../product/exception/navigate_model_not_found.dart';
import '../../../view/authenticate/onboard/view/on_board_view.dart';
import '../../../view/authenticate/test/view/test_view.dart';
import '../../../view/settings/model/settings_dynamic.dart';
import '../../../view/settings/view/subview/settings_dynamic_view.dart';
import 'package:architecture_widgets/src/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(SplashView());

      case NavigationConstants.TEST_VIEW:
 firebase-analytics
        return normalNavigate(TestsView(),NavigationConstants.TEST_VIEW);

        return normalNavigate(TestsView());

      case NavigationConstants.BUY_VIEW:
        return normalNavigate(BuyView());

      case NavigationConstants.ON_BOARD:
        return normalNavigate(OnBoardView());

      case NavigationConstants.SETTINGS_WEB_VIEW:
        if (args.arguments is SettingsDynamicModel) {
          return normalNavigate(SettingsDynamicView(
            model: args.arguments as SettingsDynamicModel,
          ));
        }
        throw NavigateException<SettingsDynamicModel>(args.arguments);

master
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget,String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      //analytciste görülecek olan sayfa ismi için pageName veriyoruz
      settings: RouteSettings(name: pageName)
    );
  }
}
