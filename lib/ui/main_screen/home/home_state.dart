import 'package:socialappflutter/model/response/post_model.dart';

abstract class HomeScreenState {}

class PostLoadedSuccess extends HomeScreenState {
  PostModel postModel;

  PostLoadedSuccess({required this.postModel});
}

class HomeScreenInitialState extends HomeScreenState {
}
