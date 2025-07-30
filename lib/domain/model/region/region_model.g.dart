// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegionModelImpl _$$RegionModelImplFromJson(Map<String, dynamic> json) =>
    _$RegionModelImpl(
      id: (json['id'] as num).toInt(),
      nameUz: json['nameUz'] as String,
      nameRu: json['nameRu'] as String,
      nameEn: json['nameEn'] as String,
      capitalUz: json['capitalUz'] as String,
      capitalRu: json['capitalRu'] as String,
      capitalEn: json['capitalEn'] as String,
      area: (json['area'] as num).toDouble(),
      population: (json['population'] as num).toInt(),
      descriptionUz: json['descriptionUz'] as String,
      descriptionRu: json['descriptionRu'] as String,
      descriptionEn: json['descriptionEn'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$RegionModelImplToJson(_$RegionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameUz': instance.nameUz,
      'nameRu': instance.nameRu,
      'nameEn': instance.nameEn,
      'capitalUz': instance.capitalUz,
      'capitalRu': instance.capitalRu,
      'capitalEn': instance.capitalEn,
      'area': instance.area,
      'population': instance.population,
      'descriptionUz': instance.descriptionUz,
      'descriptionRu': instance.descriptionRu,
      'descriptionEn': instance.descriptionEn,
      'imageUrl': instance.imageUrl,
    };
