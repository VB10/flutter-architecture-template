import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';
import '../../../../_product/_utilty/decoration_helper.dart';
import '../model/house_model.dart';
import '../service/IBuildFeedService.dart';
import '../service/build_feed_service.dart';

part 'build_feed_view_model.g.dart';

class BuildFeedViewModel = _BuildFeedViewModelBase with _$BuildFeedViewModel;

abstract class _BuildFeedViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  DecorationHelper helper;
  IBuildFeedService feedService;
  @observable
  List<String> likeItems = [];

  @action
  void onLikeItemPressed(String id) {
    if (likeItems.contains(id)) {
      likeItems.remove(id);
    } else {
      likeItems.add(id);
    }

    likeItems = likeItems;
  }

  @observable
  List<HouseModel> houseModels = [];

  @computed
  HouseModel get sliderHouse => houseModels.first;

  @observable
  bool isLoaindg = false;

  @override
  void init() {
    helper = DecorationHelper(context: context);
    feedService = BuildFeedService(vexanaManager.networkManager, scaffoldKey);
  }

  @action
  void _changeLoading() {
    isLoaindg = !isLoaindg;
  }

  @action
  Future<void> getListAll() async {
    _changeLoading();
    houseModels = await feedService.fetchUserHouseList();

    _changeLoading();
  }
}
