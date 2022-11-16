import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/friend_query.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/friend_query_enum.dart';
import 'package:fluttermvvmtemplate/view/_product/_utilty/service_helper.dart';
import 'package:fluttermvvmtemplate/view/_product/enum/network_route_enum.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/ISocialService.dart';
import 'package:vexana/vexana.dart';

class SocailService extends ISocialServiceService with ServiceHelper {
  SocailService(INetworkManager manager, GlobalKey<ScaffoldState>? scaffoldyKey) : super(manager, scaffoldyKey);

  @override
  Future<SocialUser?> fetchUser(id) async {
    final response = await manager.send<SocialUser, SocialUser>(
      NetworkRoutes.FRIENDS.rawValue,
      parseModel: SocialUser(),
      urlSuffix: '/$id',
      method: RequestType.GET,
    );
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<List<SocialUser>> fetchUserHouseList(FriendQuery query) async {
    final response = await manager.send<SocialUser, List<SocialUser>>(
      NetworkRoutes.FRIENDS.rawValue,
      parseModel: SocialUser(),
      queryParameters: {FriendQueryEnum.LIMIT.rawValue: query.limit, FriendQueryEnum.Q.rawValue: query.q},
      method: RequestType.GET,
    );
    showMessage(scaffoldyKey, response.error);
    return response.data ?? [];
  }

  @override
  Future<List<SocialUser>> fetchUserNameQuery(String text) {
    // TODO: implement fetchUserNameQuery
    throw UnimplementedError();
  }
}

// BEFORE: null safety

//  @override
//   Future<SocialUser> fetchUser(id) async {
//     final response = await manager.fetch<SocialUser, SocialUser>(NetworkRoutes.FRIENDS.rawValue,
//         parseModel: SocialUser(), urlSuffix: '/$id', method: RequestType.GET);
//     showMessage(scaffoldyKey, response.error);
//     return response.data;
//   }

//   @override
//   Future<List<SocialUser>> fetchUserHouseList(FriendQuery query) async {
//     final response = await manager.fetch<SocialUser, List<SocialUser>>(NetworkRoutes.FRIENDS.rawValue,
//         parseModel: SocialUser(),
//         queryParameters: {FriendQueryEnum.LIMIT.rawValue: query.limit, FriendQueryEnum.Q.rawValue: query.q},
//         method: RequestType.GET);
//     showMessage(scaffoldyKey, response.error);
//     return response.data ?? [];
//   }

//   @override
//   Future<List<SocialUser>> fetchUserNameQuery(String text) {
//     // TODO: implement fetchUserNameQuery
//     throw UnimplementedError();
//   }
