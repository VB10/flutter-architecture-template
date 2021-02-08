import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/friend_query.dart';
import 'package:fluttermvvmtemplate/view/_product/_utilty/thorottle_helper.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../model/social_user_model.dart';
import '../service/ISocialService.dart';
import '../service/socail_service.dart';

part 'social_view_model.g.dart';

class SocialViewModel = _SocialViewModelBase with _$SocialViewModel;

abstract class _SocialViewModelBase with Store, BaseViewModel {
  final ISocialServiceService _socialService;
  int _page = 0;
  String _query = '';
  bool isLazyLoadDataFinish = false;

  int get page => _page;

  ThrottleStringHelper _throttleStringHelper;
  @observable
  List<SocialUser> socialUserList = [];
  @observable
  bool isPageLoading = false;

  @observable
  bool isPageLoadingLazyLoad = false;

  _SocialViewModelBase(this._socialService);

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    _throttleStringHelper = ThrottleStringHelper();
    _fetchAllUser();
  }

  @action
  Future<void> _fetchAllUser() async {
    _changeLoading();
    final response = await _socialService.fetchUserHouseList(FriendQuery());
    socialUserList = response;
    _changeLoading();
  }

  @action
  Future<void> fetchAllUserLoading(int index) async {
    if (isPageLoadingLazyLoad || index != socialUserList.length - 1 || isLazyLoadDataFinish) return;
    _changeLoading();

    final response = await _socialService.fetchUserHouseList(FriendQuery(limit: _page + 1, q: _query));
    if (response.isNotEmpty) {
      if (socialUserList.isEmpty) {
        socialUserList = response;
      } else if (response.last != socialUserList.last) {
        socialUserList.addAll(response);
        socialUserList = socialUserList;
      }
      _page++;
    } else {
      isLazyLoadDataFinish = true;
    }

    _changeLoading();
  }

  @action
  void fetchAllSearchQuery(String text) {
    _throttleStringHelper.onDelayTouch(text, (text) {
      if (_query.isEmpty) {
        _page = -1;
      }
      _query = text;
      isLazyLoadDataFinish = false;
      socialUserList = [];
      fetchAllUserLoading(socialUserList.length - 1);
    });
  }

  @action
  void _changeLoading() {
    isPageLoading = !isPageLoading;
  }

  @action
  void _changeLoadingLazyLoad() {
    isPageLoadingLazyLoad = !isPageLoadingLazyLoad;
  }
}
