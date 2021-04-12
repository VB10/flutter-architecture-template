import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../home/social/model/social_user_model.dart';

class FriendCard extends StatelessWidget {
  final SocialUser user;
  final VoidCallback onPressed;

  const FriendCard({Key key, this.user, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(user.image)),
      title: Text(user.name),
      onTap: onPressed,
      subtitle: Text(user.company),
      trailing: ElevatedButton(
        onPressed: () {},
        child: Text(LocaleKeys.home_social_follow).tr(),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          textStyle: MaterialStateProperty.all(
              TextStyle(color: context.colorScheme.background)),
          backgroundColor: MaterialStateProperty.all<Color>(
              context.appTheme.buttonTheme.colorScheme.onError),
        ),
      ),
    );
  }
}


/* BEFORE: Flutter 2.0
RaisedButton (
        child: Text(LocaleKeys.home_social_follow).tr(),
        onPressed: () {},
        padding: EdgeInsets.zero,
        textColor: context.colorScheme.background,
        color: context.appTheme.buttonTheme.colorScheme.onError,
      ),

 */