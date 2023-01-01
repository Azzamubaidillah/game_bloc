import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_model.freezed.dart';
part 'data_model.g.dart';

@freezed
class DataModel with _$DataModel {
  factory DataModel({
    required int id,
    required String title,
    required String worth,
    required String thumbnail,
    required String image,
    required String description,
    required String instructions,
    required String open_giveaway_url,
    required String pubblished_date,
    required String type,
    required String platform,
    required String end_date,
    required int users,
    required int status,
    required int gamerpower_url,
  }) = _DataModel;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}
