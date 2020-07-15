import 'package:flutter/material.dart';

class PosterWidget extends StatelessWidget {
  static const POSTER_RATIO = 0.7;

  final String posterUrl;
  final double height;

  PosterWidget(
    this.posterUrl, {
    this.height = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;

    return Material(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          image: DecorationImage(
            image: NetworkImage(posterUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
