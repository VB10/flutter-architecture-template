// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) {
  return GameModel(
    sId: json['_id'] as String,
    image: json['image'] as String,
    name: json['name'] as String,
    money: json['money'] as int,
    category: json['category'] as int,
  );
}

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      '_id': instance.sId,
      'image': instance.image,
      'name': instance.name,
      'money': instance.money,
      'category': instance.category,
    };
