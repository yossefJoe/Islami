
import 'package:flutter/widgets.dart';

class AppContext {
  static BuildContext? _context;

  static void setContext(BuildContext context) {
    _context = context;
  }

  static BuildContext get context {
    if (_context == null) {
      throw Exception("AppContext لم يتم تهيئة");
    }
    return _context!;
  }
}
