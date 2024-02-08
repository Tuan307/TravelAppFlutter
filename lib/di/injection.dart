import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:socialappflutter/network/api_client.dart';

final getIt = GetIt.instance;
var saveToken = '';

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
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ),
    );

    final prettyDioLogger = getIt.get<PrettyDioLogger>();
    dio.interceptors.add(prettyDioLogger);
    dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) {
      // Kiểm tra nếu token đã hết hạn
      if (error.response?.statusCode == 401 || error.type == DioErrorType.connectTimeout) {
        if (isTokenExpired(saveToken)) {
          // Gọi hàm để lấy token mới, ở đây là một hàm async
          // Ví dụ: final newToken = await fetchNewToken();
          saveToken = "new_token"; // Thay bằng hàm lấy token mới của bạn
        }
      }
    }));
    return dio;
  });

  getIt.registerFactory<APIClient>(() {
    final dio = getIt.get<Dio>();
    dio.options.headers["Authorization"] = "Bearer $saveToken";
    print("tuanpc $saveToken");
    return APIClient(dio);
  });
}

bool isTokenExpired(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    return true; // Token không hợp lệ
  }
  final payload = parts[1];
  String decodedPayload;
  try {
    decodedPayload =
        String.fromCharCodes(base64Url.decode(base64Url.normalize(payload)));
  } catch (error) {
    print('Lỗi giải mã base64: $error');
    return true; // Token không hợp lệ
  }
  try {
    final payloadMap = json.decode(decodedPayload) as Map<String, dynamic>;
    if (payloadMap.containsKey('exp')) {
      final expiry = DateTime.fromMillisecondsSinceEpoch(
          (payloadMap['exp'] as int) * 1000);
      return expiry
          .isBefore(DateTime.now()); // Kiểm tra xem token có hết hạn hay không
    }
  } catch (error) {
    print('Lỗi khi giải mã JSON: $error');
    return true; // Token không hợp lệ
  }
  return true; // Nếu không có trường 'exp', giả sử token đã hết hạn
}