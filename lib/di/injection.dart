
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;
Future<void> configureDependencies() async {
  getIt.registerLazySingleton<PrettyDioLogger>(
        () => PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 90,
      request: true,
    ),
  );
  getIt.registerLazySingleton<Dio>(
        () => Dio(
      BaseOptions(
        connectTimeout: 30000,
        receiveTimeout: 30000,
      ),
    ),
  );
  // getIt.registerFactory<APIClient>(() {
  //   final prettyDioLogger = getIt.get<PrettyDioLogger>();
  //   final dio = getIt.get<Dio>();
  //   dio.options.headers["Authorization"] = "Bearer $saveToken";
  //   print("vuldk $saveToken");
  //   dio.interceptors.add(prettyDioLogger);
  //   return APIClient(dio);
  // });
}