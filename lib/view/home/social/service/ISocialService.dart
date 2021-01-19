import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/_model/query/friend_query.dart';
import '../model/social_user_model.dart';

abstract class ISocialServiceService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  ISocialServiceService(this.manager, this.scaffoldyKey);

  Future<List<SocialUser>> fetchUserHouseList(FriendQuery query);
  Future<List<SocialUser>> fetchUserNameQuery(String text);
  Future<SocialUser> fetchUser(id);
}
