import 'package:cinema_scheduler/data/models/data_models/details/details_ratings_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details_ratings_model.g.dart';

@JsonSerializable()
class DetailsRatingsModel {
  final double rating;
  final int ratingCount;

  DetailsRatingsModel({
    this.rating,
    this.ratingCount,
  });

  static const fromJsonFactory = _$DetailsRatingsModelFromJson;

  factory DetailsRatingsModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsRatingsModelFromJson(json);

  factory DetailsRatingsModel.fromDetailsRatingsData(DetailsRatingsData data) =>
      DetailsRatingsModel(
        rating: data.rating,
        ratingCount: data.ratingCount,
      );

  Map<String, dynamic> toJson() => _$DetailsRatingsModelToJson(this);
}
