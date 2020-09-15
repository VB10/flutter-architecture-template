import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/network/IResponseModel.dart';

import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetch<R, T extends BaseModel>(String path,
      {@required HttpTypes type,
      @required T parseModel,
      dynamic data,
      Map<String, Object> queryParameters,
      void Function(int, int) onReceiveProgress});
}

abstract class ICoreDioFull extends ICoreDio {
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseModel>(String path,
      {@required HttpTypes type,
      @required T parseModel,
      dynamic data,
      Map<String, Object> queryParameters,
      void Function(int, int) onReceiveProgress});
}
