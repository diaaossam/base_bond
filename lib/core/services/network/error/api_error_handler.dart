import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../generated/l10n.dart';
import '../../api/status_code.dart';
import 'exceptions.dart';

@injectable
class ApiErrorHandler {
  dynamic handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw ServerException(
          errors: S.current.error_bad_request,
          statusCode: error.response?.statusCode,
        );
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw ServerException(
              errors: S.current.error_bad_request,
              statusCode: error.response?.statusCode,
            );
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw ServerException(
              errors: S.current.error_unauthorized,
              statusCode: error.response?.statusCode,
            );
          case StatusCode.notFound:
            throw ServerException(
              errors: S.current.error_not_found,
              statusCode: error.response?.statusCode,
            );
          case StatusCode.conflict:
            throw ServerException(
              errors: S.current.error_conflict,
              statusCode: error.response?.statusCode,
            );
          case StatusCode.internalServerError:
            throw ServerException(
              errors: S.current.error_internal_server,
              statusCode: error.response?.statusCode,
            );
          case StatusCode.badResponse:
            throw ServerException(
              errors: error.response?.data['message'],
              statusCode: error.response?.statusCode,
            );
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        throw ServerException(
          errors: S.current.error_internal_server,
          statusCode: error.response?.statusCode,
        );
    }
  }

  dynamic handleDioErrorByStatusCode(int statusCode, String message) {
    switch (statusCode) {
      case StatusCode.badRequest:
      case StatusCode.unauthorized:
      case StatusCode.forbidden:
      case StatusCode.notFound:
      case StatusCode.conflict:
      case StatusCode.internalServerError:
      case StatusCode.badResponse:
        throw ServerException(errors: message, statusCode: statusCode);
      default:
        throw ServerException(errors: message, statusCode: statusCode);
    }
  }
}
