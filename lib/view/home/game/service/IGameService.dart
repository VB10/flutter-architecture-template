import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_enums.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_model.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/slider_model.dart';
import 'package:vexana/vexana.dart';

abstract class IGameService {
  IGameService(this.manager, this.scaffoldyKey);
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  Future<List<SliderModel>?> fetchSliderItems();
  Future<List<GameModel>?> fetchGameItems(GameEnum type);
}
