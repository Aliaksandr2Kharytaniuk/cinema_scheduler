import 'package:cinema_scheduler/data/models/app_models/details/details_plot_summary_model.dart';
import 'package:cinema_scheduler/data/models/app_models/details/details_ratings_model.dart';
import 'package:cinema_scheduler/data/models/app_models/model_base.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:cinema_scheduler/data/models/data_models/details/details_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailsModel implements ModelBase {
  @override
  final String id;
  final TitleModel title;
  final DetailsRatingsModel ratings;
  final DetailsPlotSummaryModel plotSummary;
  final List<String> genres;

  DetailsModel({
    this.id,
    this.title,
    this.ratings,
    this.plotSummary,
    this.genres,
  });

  static const fromJsonFactory = _$DetailsModelFromJson;

  factory DetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsModelFromJson(json);

  factory DetailsModel.fromDetailsData(DetailsData data) => DetailsModel(
        id: data.id,
        title: TitleModel.fromTitleData(data.title),
        ratings: DetailsRatingsModel.fromDetailsRatingsData(data.ratings),
        plotSummary: DetailsPlotSummaryModel.fromDetailsPlotSummaryData(
            data.plotSummary),
        genres: data.genres,
      );

  Map<String, dynamic> toJson() => _$DetailsModelToJson(this);
}
