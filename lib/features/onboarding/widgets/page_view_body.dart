import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quraan/core/utils/extensions/extensions.dart';

import '../../../core/constants/app_keys.dart';
import '../../../core/constants/routes.dart';
import '../../../core/global/global_exports.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/services/get_storage_service.dart';
import '../../../core/utils/helpers/navigation_helper.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/primary_button.dart';
import 'change_language_widget.dart';
import 'dots_indicator.dart';

class PageViewBody extends StatefulWidget {
  const PageViewBody({
    super.key,
    required this.index,
    required this.pageController,
  });
  final int index;
  final PageController pageController;

  @override
  State<PageViewBody> createState() => _PageViewBodyState();
}

class _PageViewBodyState extends State<PageViewBody> {
  List<String> images = [
    AssetsManager.onboarding1,
    AssetsManager.onboarding2,
    AssetsManager.onboarding3,
    AssetsManager.onboarding4,
    AssetsManager.onboarding5,
  ];
  List<String> titles = [
    strings(context).changeLanguage,
    strings(context).welcome_title,
    strings(context).reading_quran_title,
    strings(context).bearish_title,
    strings(context).radio_title,

  ];
  List<String> subtitles = [
      strings(context).changeLanguage,
      strings(context).welcome_subtitle,
      strings(context).reading_quran_subtitle,
      strings(context).bearish_subtitle,      
      strings(context).radio_subtitle,  

  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 40.rPadding,
      child: Column(
        children: [
          Spacer(),
          Image.asset(images[widget.index], height: 220.h),
          20.vSizedBox,
          CustomText(
            color: ColorsManager.primary,
            textAlign: TextAlign.center,
            maxLines: 3,
            text: titles[widget.index],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          20.vSizedBox,
          widget.index == 0
              ? ChangeLanguageWidget()
              : CustomText(
                color: ColorsManager.primary,
                textAlign: TextAlign.center,
                maxLines: 3,
                text: subtitles[widget.index],
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
          70.vSizedBox,
        ],
      ),
    );
  }
}
