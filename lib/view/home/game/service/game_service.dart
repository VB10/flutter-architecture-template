import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/_utilty/service_helper.dart';
import '../../../_product/enum/network_route_enum.dart';
import '../model/game_enums.dart';
import '../model/game_model.dart';
import '../model/slider_model.dart';
import 'IGameService.dart';

class GameService extends IGameService with ServiceHelper {
  GameService(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldyKey) : super(manager, scaffoldyKey);

  @override
  Future<List<GameModel>> fetchGameItems(GameEnum type) async {
    final response = await manager.fetch<GameModel, List<GameModel>>(NetworkRoutes.GAME.rawValue,
        urlSuffix: '/${type.index + 1}', parseModel: GameModel(), method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);

    await Future.delayed(Duration(seconds: 5));
    return response.data;
  }

  @override
  Future<List<SliderModel>> fetchSliderItems() async {
    final response =
        await manager.fetch<SliderModel, List<SliderModel>>(NetworkRoutes.SLIDER.rawValue, parseModel: SliderModel(), method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }
}
