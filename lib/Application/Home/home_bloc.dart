import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../Domain/core/failurs/main_failure.dart';
import '../../Domain/hot_and_new_respo/hot_and_new_services.dart';
import '../../Domain/hot_and_new_respo/models/hot_and_new_respo.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeservie;

  HomeBloc(this._homeservie) : super(HomeState.inital()) {
    // on event get homescreen data
    on<GetHomeScreenData>((event, emit) async {
      log('GETTING HOME SCREEN DATA');
      // send loading to UI

      emit(state.copyWith(isLoading: true, hasError: false));

      // get data
      final _movieResult = await _homeservie.getHotAndNewMovieData();

      final _tvResult = await _homeservie.getHotAndNewTvData();

      // transform data

      final _state1 = _movieResult.fold(
        (Mainfailure failure) {
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovie: [],
            trendingMovie: [],
            teensDramaMovie: [],
            southIndianMovie: [],
            trendingTvMovie: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewRespo respo) {
          final pastyear = respo.results;
          final trending = respo.results;
          final drama = respo.results;
          final southIndian = respo.results;
          pastyear.shuffle();
          trending.shuffle();
          drama.shuffle();
          southIndian.shuffle();
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovie: pastyear,
            trendingMovie: trending,
            teensDramaMovie: drama,
            southIndianMovie: southIndian,
            trendingTvMovie: state.trendingTvMovie,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(_state1);

      final _state2 = _tvResult.fold(
        (Mainfailure failure) {
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovie: [],
            trendingMovie: [],
            teensDramaMovie: [],
            southIndianMovie: [],
            trendingTvMovie: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewRespo respo) {
          final top10List = respo.results;

          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovie: state.pastYearMovie,
            trendingMovie: top10List,
            teensDramaMovie: state.teensDramaMovie,
            southIndianMovie: state.southIndianMovie,
            trendingTvMovie: top10List,
            isLoading: false,
            hasError: false,
          );
        },
      );

      // send to ui

      emit(_state2);
    });
  }
}
