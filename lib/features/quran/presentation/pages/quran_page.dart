import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quraan/core/resources/assets_manager.dart';
import 'package:quraan/core/utils/extensions/extensions.dart';

import '../../../../core/widgets/base_logo_widget.dart';
import '../widgets/surah_search_bar.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  final TextEditingController surahSearchController = TextEditingController();
  @override
  void dispose() {
    surahSearchController.dispose();
        super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsManager.quranBackground),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(children: [140.vSizedBox, SurahSearchBar(
                surahSearchController: surahSearchController,
              )]),
            ),
          ),
        ),

        BaseLogoWidget(),
      ],
    );
  }
}
