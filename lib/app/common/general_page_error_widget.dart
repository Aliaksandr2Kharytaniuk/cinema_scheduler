import 'package:cinema_scheduler/app/decorations/theme_provider.dart';
import 'package:flutter/material.dart';

class GeneralPageErrorWidget extends StatelessWidget {
  static const String ERROR_TEXT = "Ooops! Some error has occurred";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error,
            size: 80,
            color: Colors.black12,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            ERROR_TEXT,
            textAlign: TextAlign.center,
            style: ThemeProvider.getTextTheme(context).subtitle1.copyWith(
                  color: Colors.black26,
                ),
          ),
        ],
      ),
    );
  }
}
