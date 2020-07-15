import 'package:cinema_scheduler/app/decorations/theme_provider.dart';
import 'package:cinema_scheduler/data/models/details/details_ratings_data.dart';
import 'package:flutter/material.dart';

class RatingInformationWidget extends StatelessWidget {
  static const String RATINGS_LABEL = "Ratings";

  final DetailsRatingsData ratingsModel;

  RatingInformationWidget(this.ratingsModel);

  @override
  Widget build(BuildContext context) {
    var captionStyle = ThemeProvider.getTextTheme(context)
        .caption
        .copyWith(color: Colors.black45);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildNumericRatingWidget(context, captionStyle),
        SizedBox(width: 16.0),
        _buildStarsRatingWidget(context, captionStyle),
      ],
    );
  }

  Widget _buildNumericRatingWidget(
      BuildContext context, TextStyle captionStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ratingsModel.rating.toString(),
          style: ThemeProvider.getTextTheme(context).headline6.copyWith(
                fontWeight: FontWeight.w400,
                color: ThemeProvider.getTheme(context).accentColor,
              ),
        ),
        SizedBox(height: 4.0),
        Text(
          RATINGS_LABEL,
          style: captionStyle,
        ),
      ],
    );
  }

  Widget _buildStarsRatingWidget(BuildContext context, TextStyle captionStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRatingBarWidget(context),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 4.0),
          child: Text(
            ratingsModel.ratingCount.toString(),
            style: captionStyle,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingBarWidget(BuildContext context) {
    var stars = <Widget>[];

    for (var i = 1; i <= 5; i++) {
      var color = i * 2 <= ratingsModel.rating
          ? ThemeProvider.getTheme(context).accentColor
          : Colors.black12;
      var star = Icon(
        Icons.star,
        color: color,
      );

      stars.add(star);
    }

    return Row(children: stars);
  }
}
