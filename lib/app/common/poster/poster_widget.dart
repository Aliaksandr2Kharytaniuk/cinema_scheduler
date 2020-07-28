import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PosterWidget extends StatelessWidget {
  static const POSTER_RATIO = 0.7;

  final String posterUrl;
  final double height;
  final bool shouldUseLoader;

  const PosterWidget(
    this.posterUrl, {
    this.height = 100.0,
    this.shouldUseLoader = false,
  });

  @override
  Widget build(BuildContext context) {
    if (posterUrl == null || posterUrl.isEmpty) {
      return _buildPosterEmptyWidget(context);
    }

    return _buildPosterWidget(context);
  }

  Widget _buildPosterWidget(BuildContext context) {
    var width = height * POSTER_RATIO;

    return CachedNetworkImage(
      imageUrl: posterUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black12,
              BlendMode.colorBurn,
            ),
          ),
        ),
      ),
      placeholder: (BuildContext context, String url) => shouldUseLoader
          ? _buildPosterLoaderWidget(context)
          : _buildPosterEmptyWidget(context),
      errorWidget: (BuildContext context, String url, dynamic error) =>
          _buildPosterEmptyWidget(context),
    );
  }

  Widget _buildPosterLoaderWidget(BuildContext context) {
    return Container(
      width: POSTER_RATIO * height,
      height: height,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildPosterEmptyWidget(BuildContext context) {
    return Container(
      width: POSTER_RATIO * height,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.black12,
      ),
      child: Center(
        child: Icon(
          Icons.movie,
          color: Colors.black45,
        ),
      ),
    );
  }
}
