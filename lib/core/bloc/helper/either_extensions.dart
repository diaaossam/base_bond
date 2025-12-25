import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/network/error/failures.dart';
import 'base_state.dart';

mixin AsyncHandler<T> on Cubit<BaseState<T>> {
  Future<R?> handleAsync<R>({
    required Future<Either<Failure, R>> Function() call,
    required T Function(R data) onSuccess,
    String identifier = "request",
  }) async {
    emit(state.copyWith(status: BaseStatus.loading, identifier: identifier));
    final result = await call();
    return result.fold(
      (failure) {
        Fluttertoast.showToast(msg: failure.message.toString());
        emit(
          state.copyWith(status: BaseStatus.failure, identifier: identifier),
        );
        return null;
      },
      (data) {
        emit(
          state.copyWith(
            status: BaseStatus.success,
            identifier: identifier,
            data: onSuccess(data),
          ),
        );
        return data;
      },
    );
  }
}
