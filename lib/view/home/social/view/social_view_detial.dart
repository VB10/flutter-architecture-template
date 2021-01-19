import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/init/network/vexana_manager.dart';
import '../model/social_user_model.dart';
import '../service/ISocialService.dart';
import '../service/socail_service.dart';

class SocialUserViewDetail extends StatelessWidget {
  final SocialUser socialUser;

  final INetworkManager manager = VexanaManager.instance.networkManager;

  ISocialServiceService get socialServiceService => SocailService(manager, null);

  SocialUserViewDetail({
    Key key,
    this.socialUser,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: socialServiceService.fetchUser(socialUser.id).toBuild<SocialUser>(
          onSuccess: (data) {
            return Center(child: Image.network(data.image));
          },
          loaindgWidget: CircularProgressIndicator(),
          notFoundWidget: Center(
            child: Text('Not Found'),
          ),
          onError: Text('errro')),
    );
  }
}
