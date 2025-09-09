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
    AssetsManager.onboarding3,
  ];
  List<String> titles = [
    strings.moveTitle,
    strings.moveSubtitle,
    strings.moveTracking,
    strings.moveTracking,
  ];
  List<String> subtitles = [
    strings.moveStepOne,
    strings.moveStepTwo,
    strings.moveStepThree,
    strings.moveStepThree,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 10.rPadding,
      child: Column(
        children: [
          50.vSizedBox,
          Image.asset(images[widget.index], height: 250.h, width: 250.w),
          20.vSizedBox,
          Align(
            alignment:
                languageCode == 'ar' ? Alignment.topRight : Alignment.topLeft,
            child: TextButton(
              onPressed: () {
                widget.pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: CustomText(
                text: strings.skip,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: 20.hPadding,
            child: CustomText(
              maxLines: 2,
              text: titles[widget.index],
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
          ),
          10.vSizedBox,
          Padding(
            padding: 20.hPadding,
            child: CustomText(
              text: subtitles[widget.index],
              fontSize: 14,
              color: Colors.white,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
          10.vSizedBox,
          DotsIndicatorWidget(position: widget.index.toDouble()),
          30.vSizedBox,
          PrimaryButton(
            color: Colors.white,
            textColor: ColorsManager.buttonTextPrimary,
            text: widget.index == 2 ? strings.startNow : strings.next,
            onPressed: () {
              if (widget.index == 2) {
                LocalStorageService.write(AppKeys.onboardingSeen, true);
                NavigationHelper.goToPage(context, AppRoutes.login);
              } else {
                widget.pageController.animateToPage(
                  widget.index + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
          ),
          50.vSizedBox,
        ],
      ),
    );
  }
}
