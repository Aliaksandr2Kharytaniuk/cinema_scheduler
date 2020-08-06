import 'package:cinema_scheduler/data/models/data_models/title/title_image_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'title_image_model.g.dart';

@JsonSerializable()
class TitleImageModel {
  final String id;
  final int width;
  final int height;
  final String url;

  TitleImageModel({
    this.id,
    this.width,
    this.height,
    this.url,
  });

  static const fromJsonFactory = _$TitleImageModelFromJson;

  factory TitleImageModel.fromJson(Map<String, dynamic> json) =>
      _$TitleImageModelFromJson(json);

  factory TitleImageModel.fromTitleImageData(TitleImageData data) =>
      data == null
          ? null
          : TitleImageModel(
              id: data.id,
              width: data.width,
              height: data.height,
              url: data.url,
            );

  Map<String, dynamic> toJson() => _$TitleImageModelToJson(this);
}
