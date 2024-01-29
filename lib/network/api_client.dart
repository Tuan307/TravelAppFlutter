import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:socialappflutter/model/response/post_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'http://10.145.28.138:8080/api/v1/')
abstract class APIClient {
  factory APIClient(Dio dio) = _APIClient;

  @GET("post-image")
  Future<PostModel> loadNewFeed(@Query('pageCount') int pageCount,
      @Query('pageNumber') int pageNumber, @Query('sorting') String sorting);
}
