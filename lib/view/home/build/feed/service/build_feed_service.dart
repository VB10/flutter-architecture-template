import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../../_product/_utilty/service_helper.dart';
import '../../../../_product/enum/network_route_enum.dart';
import '../model/house_model.dart';
import 'IBuildFeedService.dart';

class BuildFeedService extends IBuildFeedService with ServiceHelper {
  BuildFeedService(INetworkManager manager, GlobalKey<ScaffoldState> key) : super(manager, key);

  @override
  Future<List<HouseModel>> fetchUserHouseList() async {
    final response =
        await manager.fetch<HouseModel, List<HouseModel>>(NetworkRoutes.BUILD_HOME.rawValue, parseModel: HouseModel(), method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }
}
