import 'package:socialappflutter/model/response/post_model.dart';

abstract class ProfileScreenState {}

class ProfileScreenStateInitial extends ProfileScreenState {
  ProfileScreenStateInitial();
}

class SuccessLoadUserPost extends ProfileScreenState {
  PostModel postModel;

  SuccessLoadUserPost({required this.postModel});
}

class SuccessLoadUserSavedPost extends ProfileScreenState {
  PostModel postModel;

  SuccessLoadUserSavedPost({required this.postModel});
}
