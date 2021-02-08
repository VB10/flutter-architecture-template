import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/friend_query.dart';
import 'package:mockito/mockito.dart';
import 'package:vexana/vexana.dart';

import 'feed_mockito.dart';
import 'social_network_mock.dart';

void main() {
  BuildContext context;
  SocialNetworkMock mockService;
  INetworkManager networkManager;
  SocialMockViewModel socialMockViewModel;

  setUp(() {
    context = SocialBuildContext();
    networkManager = NetworkManager(options: BaseOptions());

    mockService = SocialNetworkMock(networkManager, null);
    socialMockViewModel = SocialMockViewModel(mockService);
  });

  test('Context Test', () async {
    verify(socialMockViewModel.setContext(context));
  });

  test('Loading Test 2 ', () async {
    socialMockViewModel.fetchAllUserLoading(1);
    expect(socialMockViewModel.isPageLoading, true);
    await Future.delayed(Duration(seconds: 1));
    expect(socialMockViewModel.isPageLoading, false);
  });

  test('User All Loading', () async {
    socialMockViewModel.isPageLoadingLazyLoad = false;
    socialMockViewModel.socialUserList = [];
    socialMockViewModel.isLazyLoadDataFinish = false;

    await socialMockViewModel.fetchAllUserLoading(-1);
    expect(socialMockViewModel.socialUserList.isNotEmpty, true);
    expect(socialMockViewModel.page > 0, true);
    expect(socialMockViewModel.isPageLoading, false);
  });

  test('List check', () async {
    socialMockViewModel.setContext(context);

    await socialMockViewModel.fetchAllUserLoading(1);
    // when(socialMockViewModel.fetchAllUserLoading(0)).thenReturn(Future.value());

    expect(socialMockViewModel.socialUserList.length, 1);
  });
  test('Loading Test', () async {
    await socialMockViewModel.fetchAllUserLoading(0);
    verifyNever(socialMockViewModel.isPageLoading);
    // verify(socialMockViewModel.isPageLoading).called(2);
  });
  test('Fetch User Id', () async {
    final response = await mockService.fetchUser(10);
    expect(response, isNotNull);
  });

  test('Fetch House Id', () async {
    final response = await mockService.fetchUserHouseList(FriendQuery());
    expect(response, isNotEmpty);
  });

  test('Fetch User Name Query', () async {
    final response = await mockService.fetchUserNameQuery('hello');
    expect(response, isNotEmpty);
  });
}
