import 'package:dartz/dartz.dart';

import '../core/failurs/main_failure.dart';
import 'models/search_respo/search_respo.dart';

abstract class SearchService {
  Future<Either<Mainfailure, SearchRespo>> searchMovies({
    required String movieQuery,
  });
}
