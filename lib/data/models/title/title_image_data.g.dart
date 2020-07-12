// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_image_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TitleImageData _$TitleImageDataFromJson(Map<String, dynamic> json) {
  return TitleImageData(
    json['id'] as String,
    json['width'] as int,
    json['height'] as int,
    json['url'] as String,
  );
}

Map<String, dynamic> _$TitleImageDataToJson(TitleImageData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
