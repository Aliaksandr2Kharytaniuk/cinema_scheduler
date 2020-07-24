import 'package:cinema_scheduler/data/models/data_models/details/details_plot_summary_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details_plot_summary_model.g.dart';

@JsonSerializable()
class DetailsPlotSummaryModel {
  final String author;
  final String text;

  DetailsPlotSummaryModel({
    this.author,
    this.text,
  });

  static const fromJsonFactory = _$DetailsPlotSummaryModelFromJson;

  factory DetailsPlotSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsPlotSummaryModelFromJson(json);

  factory DetailsPlotSummaryModel.fromDetailsPlotSummaryData(
          DetailsPlotSummaryData data) =>
      DetailsPlotSummaryModel(
        author: data.author,
        text: data.text,
      );

  Map<String, dynamic> toJson() => _$DetailsPlotSummaryModelToJson(this);
}
