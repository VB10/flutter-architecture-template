import 'package:dio/dio.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/http_request_enum.dart';
import 'package:fluttermvvmtemplate/core/init/network/core_dio.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/model/on_board_model.dart';
import 'package:fluttermvvmtemplate/core/init/network/ICoreDio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/view-model/on_board_view_model.dart';

import '../../core/network/dio_mock_model.dart';

class OnBoardMockViewModel implements OnBoardViewModel {
  @override
  BuildContext context;

  @override
  ICoreDio coreDio;

  IStringHelper stringHelper;

  @override
  int currentPageIndex;

  bool isLoading = false;

  @override
  List<OnBoardModel> onBoarModel;

  @override
  void init() {
    coreDio = CoreDio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
    stringHelper = MockStringHelper();
  }

  @override
  void onPageChanged(int value) {
    currentPageIndex = value;
  }

  Future<void> onBoardGetModels() async {
    final response =
        await coreDio.fetch<List<PostModel>, PostModel>("/posts", type: HttpTypes.GET, parseModel: PostModel());

    if (response.data is List) {
      onBoarModel = response.data.map((e) => OnBoardModel(stringHelper.toUpper(e.title))).toList().cast<OnBoardModel>();
    }
  }

  Future<void> getServiceRequest() async {
    isLoading = true;
    await onBoardGetModels();
    isLoading = false;
  }

  @override
  void setContext(BuildContext context) {}
}

abstract class IStringHelper {
  String toUpper(String data);
}

class MockStringHelper extends IStringHelper {
  @override
  String toUpper(String data) {
    return data.toUpperCase();
  }
}
