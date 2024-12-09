import 'package:dartz/dartz.dart';

import 'api_error.dart';

abstract class ApiClient {
  Future<Either<ApiError, dynamic>> fetchData();
}