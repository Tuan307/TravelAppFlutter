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

  Future<void> loadNewFeed(
      LoadNewFeedEvent event, Emitter<HomeScreenState> emit) async {
    await getIt.get<APIClient>().loadNewFeed(10, event.pageNumber, 'checkInTimestamp').then((value) {
      emit(PostLoadedSuccess(postModel: value));
    }).onError((error, stackTrace) {
      print(stackTrace);
    });
  }
}
