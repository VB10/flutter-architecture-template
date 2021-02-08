import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vexana/src/interface/INetworkService.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/_model/query/friend_query.dart';
import '../../../_product/_model/query/friend_query_enum.dart';
import '../../../_product/_utilty/service_helper.dart';
import '../../../_product/enum/network_route_enum.dart';
import '../model/social_user_model.dart';
import 'ISocialService.dart';

class SocailService extends ISocialServiceService with ServiceHelper {
  SocailService(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldyKey) : super(manager, scaffoldyKey);

  @override
  Future<SocialUser> fetchUser(id) async {
    final response = await manager.fetch<SocialUser, SocialUser>(NetworkRoutes.FRIENDS.rawValue,
        parseModel: SocialUser(), urlSuffix: '/$id', method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<List<SocialUser>> fetchUserHouseList(FriendQuery query) async {
    final response = await manager.fetch<SocialUser, List<SocialUser>>(NetworkRoutes.FRIENDS.rawValue,
        parseModel: SocialUser(),
        queryParameters: {FriendQueryEnum.LIMIT.rawValue: query.limit, FriendQueryEnum.Q.rawValue: query.q},
        method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);
    return response.data ?? [];
  }

  @override
  Future<List<SocialUser>> fetchUserNameQuery(String text) {
    // TODO: implement fetchUserNameQuery
    throw UnimplementedError();
  }
}
