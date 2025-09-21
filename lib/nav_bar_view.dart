import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quraan/core/resources/colors_manager.dart';
import 'package:quraan/core/resources/styles_manager.dart';
import 'package:quraan/core/utils/extensions/extensions.dart';
import 'package:quraan/features/quran/presentation/pages/quran_page.dart';
import 'package:quraan/nav1.dart';
import 'core/resources/assets_manager.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  _NavBarViewState createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  List<Widget> pages = [QuranPage(), Nav1(), Nav1(), Nav1(), Nav1()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80.h,
        color: ColorsManager.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(0, AssetsManager.nav1, "Quran"),
            buildNavItem(1, AssetsManager.nav2, "Hadith"),
            buildNavItem(2, AssetsManager.nav3, "Tasbeeh"),
            buildNavItem(3, AssetsManager.nav4, "Radio"),
            buildNavItem(4, AssetsManager.nav5, "Time"),
          ],
        ),
      ),
      body: pages.elementAt(_currentIndex),
    );
  }

  Widget buildNavItem(int index, String icon, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              color:
                  index == _currentIndex
                      ? Colors.black.withOpacity(0.5)
                      : Colors.transparent,
              child: Image.asset(
                icon,
                height: 30,
                color: index == _currentIndex ? Colors.white : Colors.black,
              ),
            ),
          ),
          5.vSizedBox,
          index == _currentIndex
              ? Text(
                label,
                style: StylesManager.s14Regular.copyWith(color: Colors.white),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
