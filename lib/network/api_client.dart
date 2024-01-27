import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../const/network.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class APIClient {
  factory APIClient(Dio dio) = _APIClient;

  @POST("api/merchant/login")
  Future<void> login();
}