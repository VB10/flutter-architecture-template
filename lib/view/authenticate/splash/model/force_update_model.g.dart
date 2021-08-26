// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'force_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForceUpdateModel _$ForceUpdateModelFromJson(Map<String, dynamic> json) {
  return ForceUpdateModel(
    isForceUpdate: json['isForceUpdate'] as bool?,
    type: json['type'] as String?,
    currentVersion: json['currentVersion'] as String?,
  );
}

Map<String, dynamic> _$ForceUpdateModelToJson(ForceUpdateModel instance) =>
    <String, dynamic>{
      'isForceUpdate': instance.isForceUpdate,
      'type': instance.type,
      'currentVersion': instance.currentVersion,
    };
