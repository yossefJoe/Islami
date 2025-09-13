
import '../global/global_exports.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return strings (context).validationEmailRequired;
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$';
    final regex = RegExp(pattern);

    if (!regex.hasMatch(value.trim())) {
      return strings (context).validationInvalidEmail;
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return strings (context).validationPasswordRequired;
    }

    if (value.length < 6) {
      return strings (context).validationPasswordLength;
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return strings (context).validationConfirmPasswordRequired;
    }

    if (value != password) {
      return strings (context).validationPasswordMismatch;
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return strings (context).validationNameRequired;
    }

    if (value.length < 2) {
      return strings (context).validationNameLength;
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return strings (context).validationPhoneRequired;
    }

    final pattern = r'^01[0-2,5]{1}[0-9]{8}$';
    final regex = RegExp(pattern);

    if (!regex.hasMatch(value.trim())) {
      return strings (context).validationInvalidPhone;
    }

    return null;
  }

  static String? validateNotEmpty(String? value, {String fieldName = "هذا الحقل"}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName ${strings (context).validationRequired}';
    }
    return null;
  }
}
