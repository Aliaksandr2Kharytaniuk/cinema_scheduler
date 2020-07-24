import 'package:cinema_scheduler/data/models/app_models/title/title_image_model.dart';
import 'package:cinema_scheduler/data/models/data_models/title/title_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'title_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TitleModel {
  final String id;
  final int runningTimeInMinutes;
  final String title;
  final int year;
  final TitleImageModel image;

  TitleModel({
    this.id,
    this.runningTimeInMinutes,
    this.title,
    this.year,
    this.image,
  });

  static const fromJsonFactory = _$TitleModelFromJson;

  factory TitleModel.fromJson(Map<String, dynamic> json) =>
      _$TitleModelFromJson(json);

  factory TitleModel.fromTitleData(TitleData data) => TitleModel(
        id: data.id,
        runningTimeInMinutes: data.runningTimeInMinutes,
        title: data.title,
        year: data.year,
        image: TitleImageModel.fromTitleImageData(data.image),
      );

  Map<String, dynamic> toJson() => _$TitleModelToJson(this);
}
