import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../Domain/downloads/i_downloads_repo.dart';
import '../../Domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final videoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];

ValueNotifier<Set<int>> likedVideoesIdNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadRepo downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      // SENDING LOADING TO UI
      emit(
        const FastLaughState(
          videosList: [],
          isLoading: true,
          isError: false,
        ),
      );

      // get trending movies

      final _result = await downloadService.getdownloadsImages();

      final _state = _result.fold(
        (l) => const FastLaughState(
          videosList: [],
          isLoading: false,
          isError: true,
        ),
        (res) => FastLaughState(
          videosList: res,
          isLoading: false,
          isError: false,
        ),
      );

      // send to ui

      emit(_state);
    });

    on<LikeVideo>((event, emit) async {
      likedVideoesIdNotifier.value.add(event.id);
      likedVideoesIdNotifier.notifyListeners();
    });

    on<UnlikeVideo>((event, emit) {
      likedVideoesIdNotifier.value.remove(event.id);
      likedVideoesIdNotifier.notifyListeners();
    });
  }
}
