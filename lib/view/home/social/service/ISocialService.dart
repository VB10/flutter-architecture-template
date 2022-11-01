import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/friend_query.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:vexana/vexana.dart';

abstract class ISocialServiceService {
  ISocialServiceService(this.manager, this.scaffoldyKey);
  final INetworkManager manager;
  final GlobalKey<ScaffoldState>? scaffoldyKey;

  Future<List<SocialUser>> fetchUserHouseList(FriendQuery query);
  Future<List<SocialUser>> fetchUserNameQuery(String text);
  Future<SocialUser?> fetchUser(id);
}
