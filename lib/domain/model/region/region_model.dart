import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_model.freezed.dart';
part 'region_model.g.dart';

@freezed
class RegionModel with _$RegionModel {
  const factory RegionModel({
    required int id,
    required String nameUz,
    required String nameRu,
    required String nameEn,
    required String capitalUz,
    required String capitalRu,
    required String capitalEn,
    required double area,
    required int population,
    required String descriptionUz,
    required String descriptionRu,
    required String descriptionEn,
    required String imageUrl,
  }) = _RegionModel;

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);
}
