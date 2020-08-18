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
          style: ThemeProvider.getTextTheme(context).subtitle1.copyWith(
                color: Colors.white,
              ),
          decoration: InputDecoration(
            fillColor: Colors.black,
            filled: true,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: Colors.blue),
            ),
            contentPadding:
                EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: SEARCH_HINT_TEXT,
            hintStyle: ThemeProvider.getTextTheme(context).subtitle1.copyWith(
                  color: Colors.white54,
                ),
          ),
        ),
      ),
    );
  }
}
