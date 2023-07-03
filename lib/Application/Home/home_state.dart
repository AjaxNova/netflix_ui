part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotAndNewData> pastYearMovie,
    required List<HotAndNewData> trendingMovie,
    required List<HotAndNewData> teensDramaMovie,
    required List<HotAndNewData> southIndianMovie,
    required List<HotAndNewData> trendingTvMovie,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HomeState.inital() => const HomeState(
        stateId: '0',
        pastYearMovie: [],
        trendingMovie: [],
        teensDramaMovie: [],
        southIndianMovie: [],
        trendingTvMovie: [],
        isLoading: false,
        hasError: false,
      );
}
