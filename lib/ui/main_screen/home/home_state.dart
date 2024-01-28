import 'package:socialappflutter/model/response/post_model.dart';

abstract class HomeScreenState {}

class PostLoadedSuccess extends HomeScreenState {
  List<PostItem>? listOfPost;

  PostLoadedSuccess({required this.listOfPost});
}

class HomeScreenInitialState extends HomeScreenState {
}
