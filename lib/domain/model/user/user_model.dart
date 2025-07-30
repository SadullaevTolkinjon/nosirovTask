import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel(
    int? id,
    String? full_name,
    String? first_name,
    String? last_name,
    String? gender,
    DateTime? date_of_birth,
    String? phone,
  ) = _UserModel;
  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
