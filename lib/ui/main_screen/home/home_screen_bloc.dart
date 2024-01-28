import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialappflutter/di/injection.dart';
import 'package:socialappflutter/network/api_client.dart';
import 'package:socialappflutter/ui/main_screen/home/home_screen_event.dart';

import 'home_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitialState()) {
    on<LoadNewFeedEvent>(loadNewFeed);
  }

  FutureOr<void> loadNewFeed(
      LoadNewFeedEvent event, Emitter<HomeScreenState> emit) async {
    getIt.get<APIClient>().loadNewFeed(10, 1, 'checkInTimestamp').then((value) {
      emit(PostLoadedSuccess(listOfPost: value.data?.content));
    }).onError((error, stackTrace) {
      print(stackTrace);
    });
  }
}
