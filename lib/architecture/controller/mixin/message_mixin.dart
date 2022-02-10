import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessageMixin {
  void showSnackBar(
    String message, {
    String? title,
    required Color backgroundColor,
    SnackPosition? position,
  }) {
    Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 2),
      snackPosition: position ?? SnackPosition.BOTTOM,
    ));
  }

  void showSuccess(String message) {
    showSnackBar(
      message,
      backgroundColor: Colors.green,
    );
  }

  void showFailure(String message) {
    showSnackBar(
      message,
      backgroundColor: Colors.red,
    );
  }

  void showWarning(String message) {
    showSnackBar(
      message,
      backgroundColor: Colors.orange,
    );
  }
}
