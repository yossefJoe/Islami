import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../core/network/network_info.dart';

final sl = GetIt.instance;

void init() {
  final dio = Dio();

  dio.interceptors.add(PrettyDioLogger(
    requestBody: true,
    requestHeader: true,
    responseBody: true,
  ));

  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}
