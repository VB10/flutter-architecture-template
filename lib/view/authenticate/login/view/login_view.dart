import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/constants/image/image_constatns.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) => DefaultTabController(
        length: 2,
        child: Scaffold(
          key: value.scaffoldState,
          body: SafeArea(
            child: Column(
              children: [
                buildAnimatedContainer(context),
                buildContainerTabBar(context),
                Expanded(flex: 6, child: Padding(padding: context.paddingNormal, child: buildForm(value, context))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
        duration: context.lowDuration,
        height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
        color: Colors.white,
        child: Center(child: Image.asset(ImageConstants.instance.hotDog)));
  }

  Container buildContainerTabBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
      child: Padding(
        padding: EdgeInsets.only(left: context.width * 0.1, right: context.width * 0.1, bottom: context.width * 0.01),
        child: buildTabBar(context),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
        labelStyle: context.textTheme.headline5,
        unselectedLabelStyle: context.textTheme.headline5,
        labelColor: Colors.black,
        indicatorColor: Colors.yellow,
        indicatorWeight: 5,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Tab(text: '   ${LocaleKeys.login_tab1.tr()}   '),
          Tab(text: LocaleKeys.login_tab2.tr()),
        ]);
  }

  Form buildForm(LoginViewModel value, BuildContext context) {
    return Form(
      key: value.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          Spacer(flex: 6),
          buildTextFormFieldEmail(context, value),
          buildTextFormFieldPassword(context, value),
          Spacer(),
          buildTextForgot(),
          Spacer(flex: 6),
          buildRaisedButtonLogin(context, value),
          buildWrapForgot(),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildTextFormFieldPassword(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordController,
        validator: (value) => value.isNotEmpty ? null : 'This field required',
        obscureText: viewModel.isLockOpen,
        decoration: InputDecoration(
            labelStyle: context.textTheme.subtitle1,
            labelText: LocaleKeys.login_password.tr(),
            icon: buildContainerIconField(context, Icons.vpn_key),
            suffixIcon: FlatButton(
                onPressed: () {
                  viewModel.isLockStateChange();
                },
                padding: EdgeInsets.zero,
                child: Observer(builder: (_) {
                  return Icon(viewModel.isLockOpen ? Icons.lock : Icons.lock_open);
                }))),
      );
    });
  }

  TextFormField buildTextFormFieldEmail(BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: (value) => value.isValidEmails ? 'asdasd' : null,
      decoration: InputDecoration(
        labelText: LocaleKeys.login_email.tr(),
        labelStyle: context.textTheme.subtitle1,
        icon: buildContainerIconField(context, Icons.email),
      ),
    );
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      color: context.colors.onError,
      padding: context.paddingLow,
      child: Icon(icon, color: context.colors.primaryVariant),
    );
  }

  Widget buildTextForgot() => Align(alignment: Alignment.centerRight, child: Text(LocaleKeys.login_forgotText, textAlign: TextAlign.end).tr());

  Widget buildRaisedButtonLogin(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return RaisedButton(
        padding: context.paddingNormal,
        onPressed: viewModel.isLoading
            ? null
            : () {
                viewModel.fetchLoginSevice();
              },
        shape: StadiumBorder(),
        child: Center(child: Text(LocaleKeys.login_login.tr(), style: context.textTheme.headline5)),
        color: context.colors.onError,
      );
    });
  }

  Wrap buildWrapForgot() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [Text(LocaleKeys.login_dontAccount.tr()), FlatButton(onPressed: () {}, child: Text(LocaleKeys.login_tab2.tr()))],
    );
  }
}
