import 'package:flutter/material.dart';
import 'package:quraan/core/resources/assets_manager.dart';
import 'package:quraan/core/resources/colors_manager.dart';
import 'package:quraan/core/widgets/asset_image.dart';
import 'package:quraan/core/widgets/custom_text_field.dart';

class SurahSearchBar extends StatelessWidget {
  const SurahSearchBar({Key? key, required this.surahSearchController}) : super(key: key);
  final TextEditingController surahSearchController;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: surahSearchController,
      hint: "Sura Name",
      prefix: ImageIcon(
        AssetImage(AssetsManager.nav1),
        color: ColorsManager.primary,
      ),
    );
  }
}
