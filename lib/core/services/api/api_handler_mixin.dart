import 'package:dartz/dartz.dart';

import '../network/error/exceptions.dart';
import '../network/error/failures.dart';

mixin ApiHandlerMixin {
  Future<Either<Failure, T>> handleApi<T>(Future<T> Function() call) async {
    try {
      final result = await call();
      return Right(result);
    } on ServerException catch (error) {
      return Left(
        ServerFailure(code: error.statusCode ?? 0, error: error.errors),
      );
    } catch (error) {
      return Left(ServerFailure(error: error.toString(), code: 0));
    }
  }
}
