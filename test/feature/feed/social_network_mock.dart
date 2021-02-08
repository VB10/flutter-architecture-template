import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/friend_query.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/ISocialService.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/socail_service.dart';
import 'package:vexana/src/interface/INetworkService.dart';

class SocialNetworkMock extends SocailService {
  SocialNetworkMock(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldyKey) : super(manager, scaffoldyKey);
}

class SocialNetworkMockAll extends ISocialServiceService {
  SocialNetworkMockAll(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldyKey) : super(manager, scaffoldyKey);

  @override
  Future<SocialUser> fetchUser(id) async {
    await Future.delayed(Duration(seconds: 1));
    return SocialUser(name: id);
  }

  @override
  Future<List<SocialUser>> fetchUserHouseList(FriendQuery query) {
    // TODO: implement fetchUserHouseList
    throw UnimplementedError();
  }

  @override
  Future<List<SocialUser>> fetchUserNameQuery(String text) {
    // TODO: implement fetchUserNameQuery
    throw UnimplementedError();
  }
}
