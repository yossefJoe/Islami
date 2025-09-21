// MyApp
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quraan/core/constants/app_keys.dart';
import 'package:quraan/core/resources/routes_manager.dart';
import 'package:quraan/core/services/get_storage_service.dart';
import 'package:quraan/core/utils/app_context.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/global/global_exports.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(appLanguageNotifier);
    final savedLocale = LocalStorageService.read<String>(AppKeys.appLanguage);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: RoutesManager.router,
          debugShowCheckedModeBanner: false,
          title: 'Al Forsan',
          theme: ThemeData(
            canvasColor: Colors.white,
            scaffoldBackgroundColor: Colors.black,
          ),
          supportedLocales: const [Locale('en'), Locale('ar')],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          useInheritedMediaQuery: true,
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == deviceLocale?.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          locale: Locale(savedLocale ?? locale?.languageCode ?? 'ar'),
          builder: (context, child) {
            AppContext.setContext(context);
            return FlutterEasyLoading(child: child);
          },
        );
      },
    );
  }
}
