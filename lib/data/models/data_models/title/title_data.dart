import 'package:cinema_scheduler/data/models/data_models/title/title_image_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'title_data.g.dart';

@JsonSerializable(explicitToJson: true)
class TitleData {
  final String id;
  final int runningTimeInMinutes;
  final String title;
  final int year;
  final TitleImageData image;

  TitleData(
    this.id,
    this.runningTimeInMinutes,
    this.title,
    this.year,
    this.image,
  );

  static const fromJsonFactory = _$TitleDataFromJson;

  factory TitleData.fromJson(Map<String, dynamic> json) =>
      _$TitleDataFromJson(json);

  Map<String, dynamic> toJson() => _$TitleDataToJson(this);
}
