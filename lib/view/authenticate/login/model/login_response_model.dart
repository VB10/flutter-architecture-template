import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends INetworkModel<LoginResponseModel> {
  final String token;

  LoginResponseModel({this.token});

  @override
  LoginResponseModel fromJson(Map<String, Object> json) {
    return _$LoginResponseModelFromJson(json);
  }

  @override
  Map<String, Object> toJson() {
    return _$LoginResponseModelToJson(this);
  }
}
