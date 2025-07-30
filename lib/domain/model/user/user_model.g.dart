// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      (json['id'] as num?)?.toInt(),
      json['full_name'] as String?,
      json['first_name'] as String?,
      json['last_name'] as String?,
      json['gender'] as String?,
      json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      json['phone'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.full_name,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'gender': instance.gender,
      'date_of_birth': instance.date_of_birth?.toIso8601String(),
      'phone': instance.phone,
    };
