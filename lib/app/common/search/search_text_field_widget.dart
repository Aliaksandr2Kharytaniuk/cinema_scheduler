import 'package:cinema_scheduler/app/decorations/theme_provider.dart';
import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatefulWidget {
  final Function(String) onSubmittedFunction;

  const SearchTextFieldWidget({
    @required this.onSubmittedFunction,
  });

  @override
  _SearchTextFieldWidgetState createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  static const SEARCH_HINT_TEXT = "You can search here any movies...";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      child: Builder(
        builder: (context) => TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: widget.onSubmittedFunction,
          decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: Colors.black45,
            ),
            hintText: SEARCH_HINT_TEXT,
            hintStyle: ThemeProvider.getTextTheme(context).subtitle1.copyWith(
                  color: Colors.black26,
                ),
          ),
        ),
      ),
    );
  }
}
