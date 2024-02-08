abstract class ProfileScreenEvent {}

class ProfileScreenLoadDataEvent extends ProfileScreenEvent {
  String userId;
  int type;

  ProfileScreenLoadDataEvent({required this.userId, required this.type});
}
