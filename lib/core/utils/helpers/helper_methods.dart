import 'package:flutter/material.dart';

import '../../resources/colors_manager.dart';

class HelperMethods {
  HelperMethods._();

  static Future<String?> selectDate(BuildContext context, String? currentDateStr) async {
    DateTime now = DateTime.now();

    // لو فيه تاريخ قديم، افتح الـ picker عليه
    DateTime initialDate = currentDateStr != null && currentDateStr.isNotEmpty
        ? DateTime.tryParse(currentDateStr) ?? now
        : now;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1940, 1),
      lastDate: DateTime.utc(now.year, now.month, now.day),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            hintColor: ColorsManager.grey,
            colorScheme: const ColorScheme.light(primary: ColorsManager.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      return "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
    }

    return currentDateStr; // لو مقفلش picker، رجع القديم
  }

  static Future<String?> selectTime(BuildContext context, String? currentTimeStr) async {
  // parse current time if exists
  TimeOfDay initialTime;
  if (currentTimeStr != null && currentTimeStr.isNotEmpty) {
    final parts = currentTimeStr.split(":");
    if (parts.length == 2) {
      initialTime = TimeOfDay(
        hour: int.tryParse(parts[0]) ?? 12,
        minute: int.tryParse(parts[1]) ?? 0,
      );
    } else {
      initialTime = TimeOfDay.now();
    }
  } else {
    initialTime = TimeOfDay.now();
  }

  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: initialTime,
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(primary: ColorsManager.primary),
        ),
        child: child!,
      );
    },
  );

  if (picked != null) {
    final hour = picked.hour.toString().padLeft(2, '0');
    final minute = picked.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }
  return currentTimeStr;
}

}
