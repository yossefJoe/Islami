import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quraan/core/constants/app_keys.dart';
import 'package:quraan/core/constants/routes.dart';

import '../../features/Auth/presentation/views/pages/login_screen.dart';
import '../../features/onboarding/pages/onboarding_screen.dart';
import '../services/get_storage_service.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class RoutesManager {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.inital,
    observers: [routeObserver],
    routes: [
      GoRoute(
        path: AppRoutes.inital,
        builder:
            (context, state) =>
                LocalStorageService.read(AppKeys.onboardingSeen) == null
                    ? const OnboardingScreen()
                    : const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      // GoRoute(
      //   path: orderInfo,
      //   builder: (context, state) {
      //     final data = state.extra as Map<String, dynamic>;
      //     final order = data["order"] as orderDetailsModel;
      //     return OrderInfoScreen(orderParams: order);
      //   },
      // ),

      // GoRoute(
      //   path: AppRoutes.statusScreen,
      //   builder: (context, state) {
      //     final data = state.extra as Map<String, dynamic>;
      //     final listofStatuses = data["statuses"] as List<StatusModel>;
      //     return StatusScreen(statuses: listofStatuses);
      //   },
      // ),
    ],
  );
}
