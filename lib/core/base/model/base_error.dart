import 'package:fluttermvvmtemplate/core/init/network/IResponseModel.dart';

class BaseError extends IErrorModel {

  BaseError(this.message);
  final String message;
}
