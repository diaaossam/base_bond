import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_failure.dart';
import '../extensions/app_localizations_extension.dart';
import 'base_state.dart';

class AppApiResponse<C extends Cubit<BaseState<T>>, T> extends StatelessWidget {
  final C cubit;
  final Widget Function(T data) onSuccess;
  final Widget Function()? onLoading;
  final Widget Function(Object? error)? onError;
  final Widget Function()? onEmpty;
  final void Function(BaseState<T> state)? onStateChanged;

  const AppApiResponse({
    super.key,
    required this.cubit,
    required this.onSuccess,
    this.onLoading,
    this.onError,
    this.onEmpty,
    this.onStateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, BaseState<T>>(
      listener: (context, state) => onStateChanged != null ? onStateChanged!(state) : null,
      bloc: cubit,
      builder: (context, state) {
        if (state.isLoading) {
          return onLoading?.call() ??
              const Center(child: CircularProgressIndicator());
        }

        if (state.isFailure) {
          return onError?.call(state.error) ??
              AppFailureWidget(title: "خطأ", body: state.error.toString());
        }

        /// 🟣 SUCCESS — لكن بدون Data
        if (state.isSuccess && (state.data == null)) {
          return onEmpty?.call() ??
              AppFailureWidget(title: context.localizations.noData);
        }

        /// 🟢 SUCCESS — DATA موجود
        final data = state.data;

        if (data is List && data.isEmpty) {
          return onEmpty?.call() ??
              AppFailureWidget(title: context.localizations.noData);
        }

        return onSuccess(data as T);
      },
    );
  }
}
