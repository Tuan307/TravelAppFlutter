abstract class HomeScreenEvent {}

class LoadNewFeedEvent extends HomeScreenEvent {
  int pageNumber;

  LoadNewFeedEvent({required this.pageNumber});
}
