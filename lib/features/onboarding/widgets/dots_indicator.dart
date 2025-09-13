import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:quraan/core/resources/colors_manager.dart';

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget({super.key, required this.position});
  final double position;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      position: position,
      dotsCount: 5,
      decorator: DotsDecorator(
        color: Colors.grey,
        activeColor: ColorsManager.primary,
        size: const Size.square(8.0),
        activeSize: const Size(24.0, 8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        spacing: const EdgeInsets.symmetric(horizontal: 4.0),
      ),
    );
  }
}
