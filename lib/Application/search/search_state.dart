part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState(
      {required List<SearchResultdata> searchResultList,
      required List<Downloads> idleList,
      required bool isloading,
      required bool iserror}) = _SearchState;

  factory SearchState.initial() => const SearchState(
        searchResultList: [],
        idleList: [],
        isloading: false,
        iserror: false,
      );
}
