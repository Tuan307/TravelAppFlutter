import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:socialappflutter/model/response/post_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'http://192.168.1.2:8080/api/v1/')
abstract class APIClient {
  factory APIClient(Dio dio) = _APIClient;

  @POST("post-image")
  Future<PostModel> loadNewFeed(@Query('pageCount') int pageCount,
      @Query('pageNumber') int pageNumber, @Query('sorting') String sorting);
}
