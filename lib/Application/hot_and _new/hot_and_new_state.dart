part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required final List<HotAndNewData> comingSoonList,
    required final List<HotAndNewData> everyOneIsWatchingList,
    required final bool isLoading,
    required final bool hasError,
  }) = _Initial;

  factory HotAndNewState.inital() => const HotAndNewState(
        comingSoonList: [],
        everyOneIsWatchingList: [],
        hasError: false,
        isLoading: false,
      );
}
