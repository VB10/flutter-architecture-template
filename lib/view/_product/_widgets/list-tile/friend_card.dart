import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:kartal/kartal.dart';

class FriendCard extends StatelessWidget {
  const FriendCard({Key? key, this.user, this.onPressed}) : super(key: key);
  final SocialUser? user;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    if (user == null) {
      // throw Exception('User object is null $this');
      return const SizedBox();
    }
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(user!.image!)),
      title: Text(user!.name!),
      onTap: onPressed,
      subtitle: Text(user!.company!),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: context.colorScheme.background,
          foregroundColor: context.appTheme.buttonTheme.colorScheme?.onError,
        ),
        child: const Text(LocaleKeys.home_social_follow).tr(),
      ),
    );
  }
}
