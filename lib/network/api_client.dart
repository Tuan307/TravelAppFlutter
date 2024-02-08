import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:socialappflutter/const/network.dart';
import 'package:socialappflutter/model/response/post_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class APIClient {
  factory APIClient(Dio dio) = _APIClient;

  @GET("post-image")
  Future<PostModel> loadNewFeed(@Query('pageCount') int pageCount,
      @Query('pageNumber') int pageNumber, @Query('sorting') String sorting);

  @GET("post-image")
  Future<PostModel> loadUserProfilePost(
      @Query('userId') String userId,
      @Query('pageCount') int pageCount,
      @Query('pageNumber') int pageNumber,
      @Query('sorting') String sorting);
}
