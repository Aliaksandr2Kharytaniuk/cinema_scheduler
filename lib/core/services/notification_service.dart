import 'package:cinema_scheduler/app/decorations/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationService {
  static const String SUCCESS_TITLE_TEXT = "Success";
  static const String ERROR_TITLE_TEXT = "Error";

  void showSuccessNotification(String message) {
    Get.snackbar(
      SUCCESS_TITLE_TEXT,
      message,
      titleText: Text(
        SUCCESS_TITLE_TEXT,
        style: ThemeProvider.getTextTheme(Get.context).bodyText2.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
      ),
      messageText: Text(
        message,
        style: ThemeProvider.getTextTheme(Get.context).bodyText2.copyWith(
              color: Colors.white,
              fontSize: 14,
            ),
      ),
      icon: Icon(
        Icons.done,
        size: 28,
        color: Colors.green.shade300,
      ),
    );
  }

  void showErrorNotification(String message) {
    Get.snackbar(
      ERROR_TITLE_TEXT,
      message,
      titleText: Text(
        ERROR_TITLE_TEXT,
        style: ThemeProvider.getTextTheme(Get.context).bodyText2.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
      ),
      messageText: Text(
        message,
        style: ThemeProvider.getTextTheme(Get.context).bodyText2.copyWith(
              color: Colors.white,
              fontSize: 14,
            ),
      ),
      icon: Icon(
        Icons.error,
        size: 28,
        color: Colors.red.shade300,
      ),
    );
  }
}
