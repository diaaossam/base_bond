import 'package:bond/core/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';
import '../../widgets/app_failure.dart';
import '../extensions/app_localizations_extension.dart';
import '../services/network/error/failures.dart';
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
      bloc: cubit,
      listener: (context, state) {
        onStateChanged?.call(state);
        if (state.isFailure) {
          AppConstant.showCustomSnakeBar(context, state.error, false);
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return onLoading?.call() ??
              const Center(child: CircularProgressIndicator());
        }
        if (state.isFailure) {
          return onError?.call(state.error) ??
              AppFailureWidget(
                title: _getLocalizedString(
                  context,
                  (l) => l.thereIsError,
                  "Error",
                ),
              );
        }

        if (state.isSuccess) {
          final data = state.data;

          if (data == null) {
            return onEmpty?.call() ??
                AppFailureWidget(
                  title: _getLocalizedString(
                    context,
                    (l) => l.noData,
                    "No Data",
                  ),
                );
          }

          return onSuccess(data);
        }
        return onLoading?.call() ??
            const Center(child: CircularProgressIndicator());
      },
    );
  }

  String _getLocalizedString(
    BuildContext context,
    String Function(S localizations) getter,
    String fallback,
  ) {
    final s = context.localizationsMaybe;
    if (s != null) return getter(s);
    return fallback;
  }

  String _getErrorMessage(BuildContext context, Object? error) {
    // no error
    if (error == null) {
      return _getLocalizedString(context, (l) => l.thereIsError, 'Error');
    }

    try {
      if (error is Failure) {
        return error.toMessage();
      }

      // تنظيف ال Exception
      final msg = error.toString();
      return msg
          .replaceAll('Exception: ', '')
          .replaceAll('ServerException: ', '')
          .trim();
    } catch (_) {
      return _getLocalizedString(context, (l) => l.thereIsError, 'Error');
    }
  }
}
