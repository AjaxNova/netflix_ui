import 'package:dartz/dartz.dart';

import '../core/failurs/main_failure.dart';
import 'models/hot_and_new_respo.dart';

abstract class HotAndNewService {
  Future<Either<Mainfailure, HotAndNewRespo>> getHotAndNewMovieData();
  Future<Either<Mainfailure, HotAndNewRespo>> getHotAndNewTvData();
}
