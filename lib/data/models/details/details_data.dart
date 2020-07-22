import 'package:cinema_scheduler/data/models/details/details_plot_summary_data.dart';
import 'package:cinema_scheduler/data/models/details/details_ratings_data.dart';
import 'package:cinema_scheduler/data/models/title/title_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details_data.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailsData {
  final String id;
  final TitleData title;
  final DetailsRatingsData ratings;
  final DetailsPlotSummaryData plotSummary;
  final List<String> genres;

  DetailsData(
    this.id,
    this.title,
    this.ratings,
    this.plotSummary,
    this.genres,
  );

  static const fromJsonFactory = _$DetailsDataFromJson;

  factory DetailsData.fromJson(Map<String, dynamic> json) =>
      _$DetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsDataToJson(this);
}
