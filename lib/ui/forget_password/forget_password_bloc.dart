import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialappflutter/di/injection.dart';
import 'package:socialappflutter/network/api_client.dart';
import 'package:socialappflutter/ui/forget_password/forget_password_event.dart';
import 'package:socialappflutter/ui/forget_password/forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<SendRequestEvent>((event, emit) {
      sendEmailRequest(event.email);
    });
  }

  Future<void> sendEmailRequest(String email) async {

  }
}
