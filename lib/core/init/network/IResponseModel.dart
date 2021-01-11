abstract class IResponseModel<T> {
  T data;
  IErrorModel error;
}

abstract class IErrorModel<T> {
  void statusCode() {}
}

class ResponseModel<T> extends IResponseModel<T> {
  @override
  final T data;
  @override
  final IErrorModel error;

  ResponseModel({this.data, this.error});
}
