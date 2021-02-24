import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/init/lang/locale_keys.g.dart';

class HeaderButton extends StatelessWidget {
  final String titleText;
  final VoidCallback onPressed;

  const HeaderButton({Key key, this.titleText, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [buildTextTitle(context), buildFlatButtonRight(context)],
      ),
    );
  }

  Text buildTextTitle(BuildContext context) {
    return Text(
      titleText.tr(),
      style: context.textTheme.headline6.copyWith(color: context.colorScheme.onError),
    );
  }

  FlatButton buildFlatButtonRight(BuildContext context) {
    return FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          onPressed();
        },
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(LocaleKeys.home_game_viewAll.tr(), style: context.textTheme.subtitle2.copyWith(color: context.colorScheme.onError)),
            Icon(Icons.arrow_right, color: context.colorScheme.onError)
          ],
        ));
  }
}
