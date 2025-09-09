// lib/core/helpers/toast_helper.dart

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../resources/colors_manager.dart';


class ToastHelper {
  static void showSuccess(String message) {
    _showToast(message, backgroundColor: ColorsManager.success);
  }

  static void showError(String message) {
    _showToast(message, backgroundColor: ColorsManager.error);
  }

  static void showWarning(String message) {
    _showToast(message, backgroundColor: ColorsManager.warning);
  }

  static void showInfo(String message) {
    _showToast(message, backgroundColor: ColorsManager.primary);
  }

  static void _showToast(
    String message, {
    required Color backgroundColor,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Toast toastLength = Toast.LENGTH_SHORT,
  }) {
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      toastLength: toastLength,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
