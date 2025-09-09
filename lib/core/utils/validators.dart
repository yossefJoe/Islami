
import '../global/global_exports.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return strings.validationEmailRequired;
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$';
    final regex = RegExp(pattern);

    if (!regex.hasMatch(value.trim())) {
      return strings.validationInvalidEmail;
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return strings.validationPasswordRequired;
    }

    if (value.length < 6) {
      return strings.validationPasswordLength;
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return strings.validationConfirmPasswordRequired;
    }

    if (value != password) {
      return strings.validationPasswordMismatch;
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return strings.validationNameRequired;
    }

    if (value.length < 2) {
      return strings.validationNameLength;
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return strings.validationPhoneRequired;
    }

    final pattern = r'^01[0-2,5]{1}[0-9]{8}$';
    final regex = RegExp(pattern);

    if (!regex.hasMatch(value.trim())) {
      return strings.validationInvalidPhone;
    }

    return null;
  }

  static String? validateNotEmpty(String? value, {String fieldName = "هذا الحقل"}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName ${strings.validationRequired}';
    }
    return null;
  }
}
