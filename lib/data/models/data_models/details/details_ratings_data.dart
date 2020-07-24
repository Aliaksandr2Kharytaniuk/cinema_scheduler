import 'package:json_annotation/json_annotation.dart';

part 'details_ratings_data.g.dart';

@JsonSerializable()
class DetailsRatingsData {
  final double rating;
  final int ratingCount;

  DetailsRatingsData(
    this.rating,
    this.ratingCount,
  );

  static const fromJsonFactory = _$DetailsRatingsDataFromJson;

  factory DetailsRatingsData.fromJson(Map<String, dynamic> json) =>
      _$DetailsRatingsDataFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsRatingsDataToJson(this);
}
