import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import '../../Domain/core/api_endpoints.dart';
import '../../Domain/core/failurs/main_failure.dart';
import '../../Domain/downloads/i_downloads_repo.dart';
import '../../Domain/downloads/models/downloads.dart';

@LazySingleton(as: IDownloadRepo)
class DownloadRepository implements IDownloadRepo {
  @override
  Future<Either<Mainfailure, List<Downloads>>> getdownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoint.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadslist = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();

        print(downloadslist);
        return right(downloadslist);
      } else {
        return const Left(Mainfailure.serverFailure());
      }
    } catch (_) {
      return const Left(Mainfailure.clientFailure());
    }
  }
}
