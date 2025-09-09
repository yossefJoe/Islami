import 'package:flutter/material.dart';
import 'package:quraan/core/widgets/asset_image.dart';

import '../../../core/resources/assets_manager.dart';
import 'page_view_body.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: pageController,
          itemCount: 4,
          itemBuilder: (context, index) {
            return PageViewBody(pageController: pageController, index: index);
          },
        ),

        Positioned(
          top: 15,
          left: 0,
          right: 0,
          child: CustomAssetImage(assetPath: AssetsManager.behindIslami),
        ),
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: CustomAssetImage(assetPath: AssetsManager.islami),
        ),
      ],
    );
  }
}
