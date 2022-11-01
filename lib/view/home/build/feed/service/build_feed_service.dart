import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/_product/_utilty/service_helper.dart';
import 'package:fluttermvvmtemplate/view/_product/enum/network_route_enum.dart';
import 'package:fluttermvvmtemplate/view/home/build/feed/model/house_model.dart';
import 'package:fluttermvvmtemplate/view/home/build/feed/service/IBuildFeedService.dart';
import 'package:vexana/vexana.dart';

class BuildFeedService extends IBuildFeedService with ServiceHelper {
  BuildFeedService(INetworkManager manager, GlobalKey<ScaffoldState> key) : super(manager, key);

  @override
  Future<List<HouseModel>?> fetchUserHouseList() async {
    final response = await manager.send<HouseModel, List<HouseModel>>(
      NetworkRoutes.BUILD_HOME.rawValue,
      parseModel: HouseModel(),
      method: RequestType.GET,
    );
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }
}

// BEFORE: null safety
//  @override
//   Future<List<HouseModel>> fetchUserHouseList() async {
//     final response =
//         await manager.fetch<HouseModel, List<HouseModel>>(NetworkRoutes.BUILD_HOME.rawValue, parseModel: HouseModel(), method: RequestType.GET);
//     showMessage(scaffoldyKey, response.error);
//     return response.data;
//   }
