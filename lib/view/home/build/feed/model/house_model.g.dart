// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseModel _$HouseModelFromJson(Map<String, dynamic> json) {
  return HouseModel(
    id: json['_id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    image: json['image'] as String,
    user: json['user'] == null
        ? null
        : UserHouse.fromJson(json['user'] as Map<String, dynamic>),
    iV: json['iV'] as int,
  );
}

Map<String, dynamic> _$HouseModelToJson(HouseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'user': instance.user,
      'iV': instance.iV,
    };

UserHouse _$UserHouseFromJson(Map<String, dynamic> json) {
  return UserHouse(
    id: json['_id'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$UserHouseToJson(UserHouse instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'date': instance.date,
    };
