import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/ISocialService.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/socail_service.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana/vexana.dart';

class SocialUserViewDetail extends StatelessWidget {
  SocialUserViewDetail({
    Key? key,
    this.socialUser,
  }) : super(key: key);
  final SocialUser? socialUser;

  final INetworkManager manager = VexanaManager.instance.networkManager;

  ISocialServiceService get socialServiceService => SocailService(manager, null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: socialServiceService.fetchUser(socialUser!.id).toBuild(
            onSuccess: (data) {
              return Center(child: Image.network(data!.image!));
            },
            loadingWidget: const CircularProgressIndicator(),
            notFoundWidget: const Center(
              child: Text('Not Found'),
            ),
            onError: const Text('errro'),
          ),
    );
  }
}
