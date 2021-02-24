import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'slider_model.g.dart';

@JsonSerializable()
class SliderModel extends INetworkModel<SliderModel> {
  final String image;
  final String text;
  final String detailId;

  SliderModel({this.image, this.text, this.detailId});

  @override
  SliderModel fromJson(Map<String, Object> json) {
    return _$SliderModelFromJson(json);
  }

  @override
  Map<String, Object> toJson() {
    return _$SliderModelToJson(this);
  }
}
