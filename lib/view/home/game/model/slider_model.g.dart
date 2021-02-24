// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) {
  return SliderModel(
    image: json['image'] as String,
    text: json['text'] as String,
    detailId: json['detailId'] as String,
  );
}

Map<String, dynamic> _$SliderModelToJson(SliderModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'text': instance.text,
      'detailId': instance.detailId,
    };
