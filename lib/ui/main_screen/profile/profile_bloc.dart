import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialappflutter/di/injection.dart';
import 'package:socialappflutter/network/api_client.dart';
import 'package:socialappflutter/ui/main_screen/profile/profile_event.dart';
import 'package:socialappflutter/ui/main_screen/profile/profile_state.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  ProfileScreenBloc() : super(ProfileScreenStateInitial()) {
    on<ProfileScreenLoadDataEvent>(loadData);
  }

  FutureOr<void> loadData(ProfileScreenLoadDataEvent event,
      Emitter<ProfileScreenState> emit) async {
    if (event.type == 0) {
      await getIt
          .get<APIClient>()
          .loadUserProfilePost(event.userId, 100, 1, 'checkInTimestamp')
          .then((value) {
        emit(SuccessLoadUserPost(postModel: value));
      }).onError((error, stackTrace) {});
    } else {
      await getIt
          .get<APIClient>()
          .loadUserProfilePost(event.userId, 100, 1, 'checkInTimestamp')
          .then((value) {
        emit(SuccessLoadUserSavedPost(postModel: value));
      }).onError((error, stackTrace) {});
    }
  }
}
