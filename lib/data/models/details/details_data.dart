import 'package:cinema_scheduler/data/models/details/details_plot_summary_data.dart';
import 'package:cinema_scheduler/data/models/details/details_ratings_data.dart';
import 'package:cinema_scheduler/data/models/title/title_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details_data.g.dart';

@JsonSerializable()
class DetailsData {
  final TitleData title;
  final DetailsRatingsData ratings;
  final DetailsPlotSummaryData plotSummary;

  DetailsData(
    this.title,
    this.ratings,
    this.plotSummary,
  );

  static const fromJsonFactory = _$DetailsDataFromJson;

  factory DetailsData.fromJson(Map<String, dynamic> json) =>
      _$DetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsDataToJson(this);
}
