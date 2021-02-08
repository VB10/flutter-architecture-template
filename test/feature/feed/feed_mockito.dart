import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/home/social/viewmodel/social_view_model.dart';
import 'package:mockito/mockito.dart';

import 'social_network_mock.dart';

class SocialBuildContext extends Mock implements BuildContext {}

class SocialMockViewModel extends Mock implements SocialViewModel {
  SocialMockViewModel(SocialNetworkMock mockService);
  @override
  bool isPageLoading = false;
}

class SocialFakeViewModel extends Fake implements SocialViewModel {
  SocialFakeViewModel(SocialNetworkMock mockService);
  @override
  BuildContext context;

  @override
  bool isPageLoading = false;
  @override
  List<SocialUser> socialUserList = [];

  @override
  Future<void> fetchAllUserLoading(int index) async {
    isPageLoading = true;
    await Future.delayed(Duration(seconds: 1));
    socialUserList = [SocialUser(name: '')];
    isPageLoading = false;
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  void changeLoading() {
    isPageLoading = !isPageLoading;
  }
}
