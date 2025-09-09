import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/routes.dart';

class NavigationHelper {
  static void goToPage(BuildContext context, String page) {
    context.go(page);
  }

  static void goToPageWithParams(
      BuildContext context, String page, Map<String, dynamic> params) {
    context.go(page, extra: params);
  }

  static void pop(BuildContext context) {
    context.pop();
  }

  static void push(BuildContext context, String routeName) {
    context.push(routeName);
  }

  static void pushToPageWithParams(
      BuildContext context, String page, Map<String, dynamic> params) {
    context.push(page, extra: params);
  }

  static void goToLogin(BuildContext context) =>
      goToPage(context, AppRoutes.login);

  static void goToSignUp(BuildContext context) =>
      goToPage(context, AppRoutes.register);

}
