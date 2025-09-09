
import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';
import '../resources/styles_manager.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final bool enabled;
  final bool needBorder;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.width,
    this.height = 50,
    this.color,
    this.textColor,
    this.enabled = true,
    this.needBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDisabled = isLoading || !enabled;

    final Color effectiveBackgroundColor = isDisabled
        ? ColorsManager.lightGrey2
        : (color ?? Theme.of(context).primaryColor);

    final Color effectiveTextColor =
        isDisabled ? ColorsManager.grey : (textColor ?? Colors.white);

    return Opacity(
      opacity: isDisabled ? 0.8 : 1,
      child: MaterialButton(
        onPressed: isDisabled ? null : onPressed,
        color: effectiveBackgroundColor,
        disabledColor: effectiveBackgroundColor,
        height: height,
        minWidth: width ?? double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: needBorder == true
              ? BorderSide(
                  color: ColorsManager.buttonTextPrimary,
                  width: 1,
                )
              : BorderSide.none,
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                text,
                style:
                    StylesManager.s16Bold.copyWith(color: effectiveTextColor),
              ),
      ),
    );
  }
}
