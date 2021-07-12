import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/constants/image/image_constatns.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel value) =>
          buildScaffoldBody(context, value),
    );
  }

  Widget buildScaffoldBody(BuildContext context, SplashViewModel viewModel) {
    return Scaffold(
      backgroundColor: context.colorScheme.onSurface,
      body: SafeArea(
          child: Stack(
        children: [
          buildCenterTextWelcome(context, viewModel),
          buildAnimatedAlignIcon(viewModel, context),
        ],
      )),
    );
  }

  Center buildCenterTextWelcome(
      BuildContext context, SplashViewModel viewModel) {
    return Center(child: Observer(builder: (_) {
      return AnimatedOpacity(
        duration: context.durationNormal,
        opacity: viewModel.isFirstInit ? 0 : 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.splash_welcome.tr(),
              style: context.textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colorScheme.primaryVariant),
              textAlign: TextAlign.center,
            ),
            CircularProgressIndicator.adaptive()
          ],
        ),
      );
    }));
  }

  Widget buildAnimatedAlignIcon(
      SplashViewModel viewModel, BuildContext context) {
    return Observer(builder: (_) {
      return AnimatedAlign(
          alignment:
              viewModel.isFirstInit ? Alignment.center : Alignment.bottomCenter,
          duration: context.durationLow,
          child: Image.asset(ImageConstants.instance.projeIcon));
    });
  }
}
