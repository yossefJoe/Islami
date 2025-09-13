// lib/core/global/global_exports.dart

import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quraan/injection/service_locator.dart';

import '../network/network_info.dart';
import '../utils/app_context.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GetStorage storage = GetStorage();

final NetworkInfo networkInfo = sl<NetworkInfo>();

Future<bool> get hasConnection async => await  networkInfo.isConnected;
BuildContext get context => AppContext.context;
AppLocalizations strings(BuildContext context) => AppLocalizations.of(context)!;
String languageCode = Localizations.localeOf(context).languageCode;


