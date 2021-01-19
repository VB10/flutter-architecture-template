// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialUser _$SocialUserFromJson(Map<String, dynamic> json) {
  return SocialUser(
    name: json['name'] as String,
    company: json['company'] as String,
    image: json['image'] as String,
  )..id = json['_id'] as String;
}

Map<String, dynamic> _$SocialUserToJson(SocialUser instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'company': instance.company,
      'image': instance.image,
    };
