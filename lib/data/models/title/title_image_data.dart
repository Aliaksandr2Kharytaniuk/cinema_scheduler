import 'package:json_annotation/json_annotation.dart';

part 'title_image_data.g.dart';

@JsonSerializable()
class TitleImageData {
  final String id;
  final int width;
  final int height;
  final String url;

  TitleImageData(
    this.id,
    this.width,
    this.height,
    this.url,
  );

  static const fromJsonFactory = _$TitleImageDataFromJson;

  factory TitleImageData.fromJson(Map<String, dynamic> json) =>
      _$TitleImageDataFromJson(json);

  Map<String, dynamic> toJson() => _$TitleImageDataToJson(this);
}