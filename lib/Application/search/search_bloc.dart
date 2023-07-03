import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../Domain/core/failurs/main_failure.dart';
import '../../Domain/downloads/i_downloads_repo.dart';
import '../../Domain/downloads/models/downloads.dart';
import '../../Domain/search/models/search_respo/search_respo.dart';
import '../../Domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadRepo _downloadsService;
  final SearchService _searchService;

  SearchBloc(
    this._downloadsService,
    this._searchService,
  ) : super(SearchState.initial()) {
    //  idle state

    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
          searchResultList: [],
          idleList: state.idleList,
          isloading: false,
          iserror: false,
        ));
        return;
      }
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isloading: true,
        iserror: false,
      ));
      // get trending
      final result = await _downloadsService.getdownloadsImages();
      final _state = result.fold(
        (Mainfailure f) {
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isloading: false,
            iserror: true,
          );
        },
        (List<Downloads> list) {
          return SearchState(
            searchResultList: [],
            idleList: list,
            isloading: false,
            iserror: false,
          );
        },
      );

      // show to ui
      emit(_state);
    });

    // search result state

    on<SearchMovie>((event, emit) async {
      // call search movie api

      log('Searching for ${event.movieQuery}');
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isloading: true,
        iserror: false,
      ));

      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold(
        (Mainfailure f) {
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isloading: false,
            iserror: true,
          );
        },
        (SearchRespo r) {
          return SearchState(
            searchResultList: r.results,
            idleList: [],
            isloading: false,
            iserror: false,
          );
        },
      );

      // show to ui
      emit(_state);
    });
  }
}
