import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:dartz/dartz.dart';

import '../../Domain/core/api_endpoints.dart';
import '../../Domain/core/failurs/main_failure.dart';
import '../../Domain/search/models/search_respo/search_respo.dart';
import '../../Domain/search/search_service.dart';

@LazySingleton(as: SearchService)
class SearchImplementaion implements SearchService {
  @override
  Future<Either<Mainfailure, SearchRespo>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoint.search,
        queryParameters: {'query': movieQuery},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchRespo.fromJson(response.data);
        return right(result);
      } else {
        return const Left(Mainfailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(Mainfailure.clientFailure());
    }
  }
}
