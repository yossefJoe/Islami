import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quraan/core/global/global_exports.dart';
import 'package:quraan/core/resources/colors_manager.dart';
import 'package:quraan/core/services/get_storage_service.dart';

import '../../../core/constants/app_keys.dart';
import '../../../core/resources/assets_manager.dart';

class ChangeLanguageWidget extends ConsumerStatefulWidget {
  const ChangeLanguageWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangeLanguageWidgetState();
}

class _ChangeLanguageWidgetState extends ConsumerState<ChangeLanguageWidget> {
  String selected = languageCode == 'en' ? 'US' : 'YE';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.primary),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildLanguage('US', AssetsManager.us),
          buildLanguage('YE', AssetsManager.ar),
        ],
      ),
    );
  }

  String determineLanguage(String languageCode) {
    if (languageCode == 'US') {
      return 'en';
    } else {
      return 'ar';
    }
  }

  Widget buildLanguage(String language, String icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selected = language;
            print(language);
          });
          ref.read(appLanguageNotifier.notifier).state = Locale(
            determineLanguage(language),
          );
          LocalStorageService.write(
            AppKeys.appLanguage,
            determineLanguage(language),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color:
                selected == language
                    ? ColorsManager.primary
                    : Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),

          child: Image.asset(icon, width: 20),
        ),
      ),
    );
  }
}
