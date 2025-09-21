import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/assets_manager.dart';

class BaseLogoWidget extends StatelessWidget {
  const BaseLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      left: 0,
      right: 0,
      child: Stack(
        children: [
          Container(
            height: 150.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsManager.behindIslami),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 80.h,
            left: 0,
            right: 0,
            child: Container(
              height: 55.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsManager.islami),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
