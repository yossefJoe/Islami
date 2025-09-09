import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quraan/core/resources/routes_manager.dart';
import 'package:quraan/core/utils/app_context.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     EasyLoading.init();

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: RoutesManager.router,
        debugShowCheckedModeBanner: false,
        title: 'Al Forsan',
        theme: ThemeData(
          canvasColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
        ),
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        useInheritedMediaQuery: true,
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        locale: Locale('en'),
        builder: (context, child) {
          AppContext.setContext(context); // ← تسجيل الـ context
          return EasyLoading.init()(context, child!);
        },
      ),
    );
  }
}