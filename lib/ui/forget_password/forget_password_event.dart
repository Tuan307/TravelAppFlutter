abstract class ForgetPasswordEvent {}

class SendRequestEvent extends ForgetPasswordEvent {
  String email;
  SendRequestEvent({required this.email});
}
