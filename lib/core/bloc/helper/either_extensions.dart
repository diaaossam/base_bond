import 'package:bond/config/helper/context_helper.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
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
        final context= NavigationService.navigatorKey.currentContext;
        Fluttertoast.showToast(msg: failure.message.toString(),backgroundColor:Colors.red ,gravity: ToastGravity.TOP);

        /* if(context != null){
          AppConstant.showCustomSnakeBar(context, failure.message.toString(), false);
        }else{
           Fluttertoast.showToast(msg: failure.message.toString(),backgroundColor:Colors.red );
        }*/
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
