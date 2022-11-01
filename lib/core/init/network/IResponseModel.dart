abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}

abstract class IErrorModel<T> {
  void statusCode() {}
}

class ResponseModel<T> extends IResponseModel<T> {

  ResponseModel({this.data, this.error});
  @override
  final T? data;
  @override
  final IErrorModel? error;
}
