import 'package:chopper/chopper.dart';
import 'package:cinema_scheduler/core/json_serializable_converter.dart';
import 'package:cinema_scheduler/data/models/data_models/details/details_data.dart';
import 'package:cinema_scheduler/data/models/data_models/details/details_plot_summary_data.dart';
import 'package:cinema_scheduler/data/models/data_models/details/details_ratings_data.dart';
import 'package:cinema_scheduler/data/models/data_models/search/search_data.dart';
import 'package:cinema_scheduler/data/models/data_models/title/title_data.dart';
import 'package:cinema_scheduler/data/models/data_models/title/title_image_data.dart';
import 'package:cinema_scheduler/data/repositories/details/details_repository.dart';
import 'package:cinema_scheduler/data/repositories/search/search_repository.dart';
import 'package:cinema_scheduler/core/services/navigation_service.dart';
import 'package:cinema_scheduler/data/services/details/details_api_service.dart';
import 'package:cinema_scheduler/data/services/search/search_api_service.dart';

final NavigationService navigationService = NavigationService();
final SearchRepository searchRepository = SearchRepository();
final DetailsRepository detailsRepository = DetailsRepository();

final JsonSerializableConverter jsonSerializableConverter =
    JsonSerializableConverter();
final CustomJsonDecoder jsonDecoder = CustomJsonDecoder({
  SearchData: SearchData.fromJsonFactory,
  TitleData: TitleData.fromJsonFactory,
  TitleImageData: TitleImageData.fromJsonFactory,
  DetailsData: DetailsData.fromJsonFactory,
  DetailsRatingsData: DetailsRatingsData.fromJsonFactory,
  DetailsPlotSummaryData: DetailsPlotSummaryData.fromJsonFactory,
});

ChopperClient createChopperClient() {
  return ChopperClient(
    services: [
      SearchApiService.create(),
      DetailsApiService.create(),
    ],
    converter: jsonSerializableConverter,
  );
}
