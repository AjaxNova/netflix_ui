import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:dartz/dartz.dart';

import '../../Domain/core/api_endpoints.dart';
import '../../Domain/core/failurs/main_failure.dart';
import '../../Domain/hot_and_new_respo/hot_and_new_services.dart';
import '../../Domain/hot_and_new_respo/models/hot_and_new_respo.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplemention implements HotAndNewService {
  @override
  Future<Either<Mainfailure, HotAndNewRespo>> getHotAndNewMovieData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoint.hotAndNewMovie);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewRespo.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(Mainfailure.serverFailure());
      }
    } catch (e) {
      return const Left(Mainfailure.clientFailure());
    }
  }

  @override
  Future<Either<Mainfailure, HotAndNewRespo>> getHotAndNewTvData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoint.hotAndNewTv);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewRespo.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(Mainfailure.serverFailure());
      }
    } catch (e) {
      return const Left(Mainfailure.clientFailure());
    }
  }
}
