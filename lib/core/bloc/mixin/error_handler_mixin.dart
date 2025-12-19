import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../services/network/error/failures.dart';
import '../helper/error_emitter.dart';

mixin ErrorHandlerMixin<T> on Cubit<T> {

  Future<void> handleResult<R>({
    required Either<Failure, R> result,
    required T Function(R data) onSuccess,
    T Function(String error)? onError,
  }) async {
    result.fold(
      (failure) {
        final errorMessage = _getErrorMessage(failure);
        if (onError != null) {
          Fluttertoast.showToast(msg: errorMessage,);
          emit(onError(errorMessage));
        }
      },
      (data) {
        emit(onSuccess(data));
      },
    );
  }

  String _getErrorMessage(Failure failure) {
    if (failure.message.isNotEmpty) {
      return failure.message;
    }
    return failure.toString();
  }

  void _logError(String error) {
    print('❌ Error: $error');
  }
}
