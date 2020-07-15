// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsData _$DetailsDataFromJson(Map<String, dynamic> json) {
  return DetailsData(
    json['title'] == null
        ? null
        : TitleData.fromJson(json['title'] as Map<String, dynamic>),
    json['ratings'] == null
        ? null
        : DetailsRatingsData.fromJson(json['ratings'] as Map<String, dynamic>),
    json['plotSummary'] == null
        ? null
        : DetailsPlotSummaryData.fromJson(
            json['plotSummary'] as Map<String, dynamic>),
    (json['genres'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$DetailsDataToJson(DetailsData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'ratings': instance.ratings,
      'plotSummary': instance.plotSummary,
      'genres': instance.genres,
    };
