import 'package:flutter/material.dart';

extension PaddingExtension on num {
  /// EdgeInsets.all(10)
  EdgeInsets get rPadding => EdgeInsets.all(toDouble());

  /// EdgeInsets.symmetric(horizontal: 10)
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: toDouble());

  /// EdgeInsets.symmetric(vertical: 10)
  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: toDouble());
}

extension SizedBoxExtension on num {
  /// SizedBox(height: 10)
  SizedBox get vSizedBox => SizedBox(height: toDouble());

  /// SizedBox(width: 10)
  SizedBox get hSizedBox => SizedBox(width: toDouble());
}

extension RadiusExtension on num {
  /// BorderRadius.circular(10)
  BorderRadius get circularRadius => BorderRadius.circular(toDouble());

  /// Radius.circular(10)
  Radius get circular => Radius.circular(toDouble());
}
