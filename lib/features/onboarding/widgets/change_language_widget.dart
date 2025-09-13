import 'package:flutter/material.dart';
import 'package:quraan/core/global/global_exports.dart';
import 'package:quraan/core/resources/colors_manager.dart';

import '../../../core/resources/assets_manager.dart';

class ChangeLanguageWidget extends StatefulWidget {
  const ChangeLanguageWidget({Key? key}) : super(key: key);

  @override
  State<ChangeLanguageWidget> createState() => _ChangeLanguageWidgetState();
}

class _ChangeLanguageWidgetState extends State<ChangeLanguageWidget> {
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

  Widget buildLanguage(String language, String icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selected = language;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color:
                selected == language
                    ? ColorsManager.primary
                    : Colors.transparent,
            borderRadius:
                selected == "US"
                    ? BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )
                    : BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
          ),

          child: Image.asset(icon, width: 20),
        ),
      ),
    );
  }
}
