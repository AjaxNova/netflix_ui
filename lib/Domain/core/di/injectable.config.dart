// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../Application/downloads/downloads_bloc.dart' as _i9;
import '../../../Application/fast_laugh/fast_laugh_bloc.dart' as _i10;
import '../../../Application/Home/home_bloc.dart' as _i11;
import '../../../Application/hot_and%20_new/hot_and_new_bloc.dart' as _i12;
import '../../../Application/search/search_bloc.dart' as _i13;
import '../../../Infracture/downloads/downloads_repo.dart' as _i6;
import '../../../Infracture/hot%20_and_new/hot_and_new_impleme.dart' as _i4;
import '../../../Infracture/search/search_implem.dart' as _i8;
import '../../downloads/i_downloads_repo.dart' as _i5;
import '../../hot_and_new_respo/hot_and_new_services.dart' as _i3;
import '../../search/search_service.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.HotAndNewService>(() => _i4.HotAndNewImplemention());
  gh.lazySingleton<_i5.IDownloadRepo>(() => _i6.DownloadRepository());
  gh.lazySingleton<_i7.SearchService>(() => _i8.SearchImplementaion());
  gh.factory<_i9.DownloadsBloc>(
      () => _i9.DownloadsBloc(get<_i5.IDownloadRepo>()));
  gh.factory<_i10.FastLaughBloc>(
      () => _i10.FastLaughBloc(get<_i5.IDownloadRepo>()));
  gh.factory<_i11.HomeBloc>(() => _i11.HomeBloc(get<_i3.HotAndNewService>()));
  gh.factory<_i12.HotAndNewBloc>(
      () => _i12.HotAndNewBloc(get<_i3.HotAndNewService>()));
  gh.factory<_i13.SearchBloc>(() => _i13.SearchBloc(
        get<_i5.IDownloadRepo>(),
        get<_i7.SearchService>(),
      ));
  return get;
}
