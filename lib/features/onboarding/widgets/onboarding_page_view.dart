import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quraan/core/resources/colors_manager.dart';
import 'package:quraan/core/widgets/custom_text_button.dart';
import 'package:quraan/features/onboarding/widgets/dots_indicator.dart';

import '../../../core/constants/routes.dart';
import '../../../core/global/global_exports.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/utils/helpers/navigation_helper.dart';
import '../../../core/widgets/custom_text.dart';
import 'page_view_body.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      if (widget.pageController.hasClients) {
        setState(() {
          _currentPage = widget.pageController.page ?? 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: widget.pageController,
          itemCount: 5,
          itemBuilder: (context, index) {
            return PageViewBody(
              pageController: widget.pageController,
              index: index,
            );
          },
        ),
        Positioned(
          top: 60.h,
          left: 0,
          right: 0,
          child: Container(
            height: 150.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsManager.behindIslami),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Positioned(
          top: 130.h,
          left: 0,
          right: 0,
          child: Container(
            height: 70.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsManager.islami),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTextButton(
                text: strings(context).back,
                color: ColorsManager.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                onPressed: () {
                  if (_currentPage > 0) {
                    widget.pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
              ),
              DotsIndicatorWidget(position: _currentPage),
              Align(
                alignment:
                    languageCode == 'ar'
                        ? Alignment.topRight
                        : Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    if (_currentPage < 4) {
                      widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                     NavigationHelper.goToPage(context, AppRoutes.navBar);
                    }
                  },
                  child: CustomText(
                    text:
                        _currentPage.round() == 4
                            ? strings (context).finish
                            : strings (context).next,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
