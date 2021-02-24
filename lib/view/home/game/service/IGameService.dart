import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/game_enums.dart';
import '../model/game_model.dart';
import '../model/slider_model.dart';

abstract class IGameService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  IGameService(this.manager, this.scaffoldyKey);

  Future<List<SliderModel>> fetchSliderItems();
  Future<List<GameModel>> fetchGameItems(GameEnum type);
}
