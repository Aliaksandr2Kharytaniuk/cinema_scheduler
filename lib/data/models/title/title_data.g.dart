// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TitleData _$TitleDataFromJson(Map<String, dynamic> json) {
  return TitleData(
    json['id'] as String,
    json['runningTimeInMinutes'] as int,
    json['title'] as String,
    json['year'] as int,
    json['image'] == null
        ? null
        : TitleImageData.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TitleDataToJson(TitleData instance) => <String, dynamic>{
      'id': instance.id,
      'runningTimeInMinutes': instance.runningTimeInMinutes,
      'title': instance.title,
      'year': instance.year,
      'image': instance.image,
    };
