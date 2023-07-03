import 'package:dartz/dartz.dart';

import '../core/failurs/main_failure.dart';
import 'models/downloads.dart';

abstract class IDownloadRepo {
  Future<Either<Mainfailure, List<Downloads>>> getdownloadsImages();
}
