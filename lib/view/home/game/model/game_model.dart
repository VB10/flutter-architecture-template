import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel extends INetworkModel<GameModel> {
  GameModel({
    this.sId,
    this.image,
    this.name,
    this.money,
    this.category,
  });
  @JsonKey(name: '_id')
  String? sId;
  String? image;
  String? name;
  int? money;
  int? category;

  @override
  GameModel fromJson(Map<String, Object?> json) {
    return _$GameModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$GameModelToJson(this);
  }
}
