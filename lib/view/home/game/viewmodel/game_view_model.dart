import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../model/game_enums.dart';
import '../model/game_model.dart';
import '../model/slider_model.dart';
import '../service/game_service.dart';

part 'game_view_model.g.dart';

class GameViewModel = _GameViewModelBase with _$GameViewModel;

abstract class _GameViewModelBase with Store, BaseViewModel {
  final List<String> gameTabItems = [
    LocaleKeys.home_game_tabbar_tab1,
    LocaleKeys.home_game_tabbar_tab2,
    LocaleKeys.home_game_tabbar_tab3,
    LocaleKeys.home_game_tabbar_tab4,
    LocaleKeys.home_game_tabbar_tab5
  ];

  final GameService gameService;

  List<SliderModel> sliderItems = [];
  List<GameModel> newsGameItems = [];
  List<GameModel> topGameITems = [];
  _GameViewModelBase(this.gameService);

  @override
  void setContext(BuildContext context) => this.context = context;

  @observable
  bool isLoading = false;

  @override
  void init() {
    fetchSliderItems();
  }

  @action
  Future<void> fetchSliderItems() async {
    changeLoading();
    final response = await gameService.fetchSliderItems();
    sliderItems = response;
    changeLoading();
  }

  Future<List<GameModel>> onNewsGameItems() async {
    if (newsGameItems.isNotEmpty) return newsGameItems;
    final response = await gameService.fetchGameItems(GameEnum.NEW);
    newsGameItems = response ?? [];

    return response;
  }

  Future<List<GameModel>> onTopGameItems() async {
    if (newsGameItems.isNotEmpty) return newsGameItems;
    final response = await gameService.fetchGameItems(GameEnum.TOP);
    newsGameItems = response ?? [];

    return response;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
