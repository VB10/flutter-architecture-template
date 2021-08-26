import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'force_update_model.g.dart';

@JsonSerializable()
class ForceUpdateModel extends INetworkModel<ForceUpdateModel> {
  bool? isForceUpdate;
  String? type;
  String? currentVersion;
  ForceUpdateModel({
    this.isForceUpdate,
    this.type,
    this.currentVersion,
  });

  @override
  ForceUpdateModel fromJson(Map<String, dynamic> json) {
    return _$ForceUpdateModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ForceUpdateModelToJson(this);
  }
}
