// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'burger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BurgerModel _$BurgerModelFromJson(Map<String, dynamic> json) {
  return BurgerModel()
    ..id = json['_id'] as String?
    ..image = json['image'] as String?
    ..name = json['name'] as String?
    ..price = json['price'] as int?
    ..rates = json['rates'] as int?
    ..isFavorite = json['isFavorite'] as bool?
    ..updated = json['updated'] as String?;
}

Map<String, dynamic> _$BurgerModelToJson(BurgerModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
      'rates': instance.rates,
      'isFavorite': instance.isFavorite,
      'updated': instance.updated,
    };
