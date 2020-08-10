import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushbarNotificationWidget extends StatelessWidget {
  static const String FLUSHBAR_SUCCESS_TEXT = "Success";
  static const String FLUSHBAR_ERROR_TEXT = "Error";

  final bool isFlushbarSuccess;
  final String flushbarMessage;

  const FlushbarNotificationWidget({
    @required this.isFlushbarSuccess,
    @required this.flushbarMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Flushbar(
      title: isFlushbarSuccess ? FLUSHBAR_SUCCESS_TEXT : FLUSHBAR_ERROR_TEXT,
      message: flushbarMessage,
      icon: _buildFlushbarIcon(),
      backgroundColor: Colors.black87,
      margin: EdgeInsets.all(8),
      borderRadius: 8,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
    )..show(context);
  }

  Widget _buildFlushbarIcon() {
    if (isFlushbarSuccess) {
      return Icon(
        Icons.done,
        size: 28,
        color: Colors.green.shade300,
      );
    }

    return Icon(
      Icons.error,
      size: 28,
      color: Colors.red.shade300,
    );
  }
}
