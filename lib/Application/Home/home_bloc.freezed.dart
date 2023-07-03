// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeScreenData value) getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeScreenData value)? getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetHomeScreenDataCopyWith<$Res> {
  factory _$$GetHomeScreenDataCopyWith(
          _$GetHomeScreenData value, $Res Function(_$GetHomeScreenData) then) =
      __$$GetHomeScreenDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHomeScreenDataCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetHomeScreenData>
    implements _$$GetHomeScreenDataCopyWith<$Res> {
  __$$GetHomeScreenDataCopyWithImpl(
      _$GetHomeScreenData _value, $Res Function(_$GetHomeScreenData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetHomeScreenData implements GetHomeScreenData {
  const _$GetHomeScreenData();

  @override
  String toString() {
    return 'HomeEvent.getHomeScreenData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHomeScreenData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeScreenData,
  }) {
    return getHomeScreenData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeScreenData,
  }) {
    return getHomeScreenData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
    required TResult orElse(),
  }) {
    if (getHomeScreenData != null) {
      return getHomeScreenData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeScreenData value) getHomeScreenData,
  }) {
    return getHomeScreenData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeScreenData value)? getHomeScreenData,
  }) {
    return getHomeScreenData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
    required TResult orElse(),
  }) {
    if (getHomeScreenData != null) {
      return getHomeScreenData(this);
    }
    return orElse();
  }
}

abstract class GetHomeScreenData implements HomeEvent {
  const factory GetHomeScreenData() = _$GetHomeScreenData;
}

/// @nodoc
mixin _$HomeState {
  String get stateId => throw _privateConstructorUsedError;
  List<HotAndNewData> get pastYearMovie => throw _privateConstructorUsedError;
  List<HotAndNewData> get trendingMovie => throw _privateConstructorUsedError;
  List<HotAndNewData> get teensDramaMovie => throw _privateConstructorUsedError;
  List<HotAndNewData> get southIndianMovie =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get trendingTvMovie => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {String stateId,
      List<HotAndNewData> pastYearMovie,
      List<HotAndNewData> trendingMovie,
      List<HotAndNewData> teensDramaMovie,
      List<HotAndNewData> southIndianMovie,
      List<HotAndNewData> trendingTvMovie,
      bool isLoading,
      bool hasError});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? pastYearMovie = null,
    Object? trendingMovie = null,
    Object? teensDramaMovie = null,
    Object? southIndianMovie = null,
    Object? trendingTvMovie = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      pastYearMovie: null == pastYearMovie
          ? _value.pastYearMovie
          : pastYearMovie // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingMovie: null == trendingMovie
          ? _value.trendingMovie
          : trendingMovie // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      teensDramaMovie: null == teensDramaMovie
          ? _value.teensDramaMovie
          : teensDramaMovie // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      southIndianMovie: null == southIndianMovie
          ? _value.southIndianMovie
          : southIndianMovie // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingTvMovie: null == trendingTvMovie
          ? _value.trendingTvMovie
          : trendingTvMovie // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stateId,
      List<HotAndNewData> pastYearMovie,
      List<HotAndNewData> trendingMovie,
      List<HotAndNewData> teensDramaMovie,
      List<HotAndNewData> southIndianMovie,
      List<HotAndNewData> trendingTvMovie,
      bool isLoading,
      bool hasError});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? pastYearMovie = null,
    Object? trendingMovie = null,
    Object? teensDramaMovie = null,
    Object? southIndianMovie = null,
    Object? trendingTvMovie = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_$_Initial(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      pastYearMovie: null == pastYearMovie
          ? _value._pastYearMovie
          : pastYearMovie // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingMovie: null == trendingMovie
          ? _value._trendingMovie
          : trendingMovie // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      teensDramaMovie: null == teensDramaMovie
          ? _value._teensDramaMovie
          : teensDramaMovie // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      southIndianMovie: null == southIndianMovie
          ? _value._southIndianMovie
          : southIndianMovie // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingTvMovie: null == trendingTvMovie
          ? _value._trendingTvMovie
          : trendingTvMovie // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.stateId,
      required final List<HotAndNewData> pastYearMovie,
      required final List<HotAndNewData> trendingMovie,
      required final List<HotAndNewData> teensDramaMovie,
      required final List<HotAndNewData> southIndianMovie,
      required final List<HotAndNewData> trendingTvMovie,
      required this.isLoading,
      required this.hasError})
      : _pastYearMovie = pastYearMovie,
        _trendingMovie = trendingMovie,
        _teensDramaMovie = teensDramaMovie,
        _southIndianMovie = southIndianMovie,
        _trendingTvMovie = trendingTvMovie;

  @override
  final String stateId;
  final List<HotAndNewData> _pastYearMovie;
  @override
  List<HotAndNewData> get pastYearMovie {
    if (_pastYearMovie is EqualUnmodifiableListView) return _pastYearMovie;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastYearMovie);
  }

  final List<HotAndNewData> _trendingMovie;
  @override
  List<HotAndNewData> get trendingMovie {
    if (_trendingMovie is EqualUnmodifiableListView) return _trendingMovie;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingMovie);
  }

  final List<HotAndNewData> _teensDramaMovie;
  @override
  List<HotAndNewData> get teensDramaMovie {
    if (_teensDramaMovie is EqualUnmodifiableListView) return _teensDramaMovie;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teensDramaMovie);
  }

  final List<HotAndNewData> _southIndianMovie;
  @override
  List<HotAndNewData> get southIndianMovie {
    if (_southIndianMovie is EqualUnmodifiableListView)
      return _southIndianMovie;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_southIndianMovie);
  }

  final List<HotAndNewData> _trendingTvMovie;
  @override
  List<HotAndNewData> get trendingTvMovie {
    if (_trendingTvMovie is EqualUnmodifiableListView) return _trendingTvMovie;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingTvMovie);
  }

  @override
  final bool isLoading;
  @override
  final bool hasError;

  @override
  String toString() {
    return 'HomeState(stateId: $stateId, pastYearMovie: $pastYearMovie, trendingMovie: $trendingMovie, teensDramaMovie: $teensDramaMovie, southIndianMovie: $southIndianMovie, trendingTvMovie: $trendingTvMovie, isLoading: $isLoading, hasError: $hasError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            const DeepCollectionEquality()
                .equals(other._pastYearMovie, _pastYearMovie) &&
            const DeepCollectionEquality()
                .equals(other._trendingMovie, _trendingMovie) &&
            const DeepCollectionEquality()
                .equals(other._teensDramaMovie, _teensDramaMovie) &&
            const DeepCollectionEquality()
                .equals(other._southIndianMovie, _southIndianMovie) &&
            const DeepCollectionEquality()
                .equals(other._trendingTvMovie, _trendingTvMovie) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stateId,
      const DeepCollectionEquality().hash(_pastYearMovie),
      const DeepCollectionEquality().hash(_trendingMovie),
      const DeepCollectionEquality().hash(_teensDramaMovie),
      const DeepCollectionEquality().hash(_southIndianMovie),
      const DeepCollectionEquality().hash(_trendingTvMovie),
      isLoading,
      hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {required final String stateId,
      required final List<HotAndNewData> pastYearMovie,
      required final List<HotAndNewData> trendingMovie,
      required final List<HotAndNewData> teensDramaMovie,
      required final List<HotAndNewData> southIndianMovie,
      required final List<HotAndNewData> trendingTvMovie,
      required final bool isLoading,
      required final bool hasError}) = _$_Initial;

  @override
  String get stateId;
  @override
  List<HotAndNewData> get pastYearMovie;
  @override
  List<HotAndNewData> get trendingMovie;
  @override
  List<HotAndNewData> get teensDramaMovie;
  @override
  List<HotAndNewData> get southIndianMovie;
  @override
  List<HotAndNewData> get trendingTvMovie;
  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
