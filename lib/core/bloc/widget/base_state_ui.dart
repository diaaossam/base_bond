import 'package:bond/core/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../widgets/app_failure.dart';
import '../../extensions/app_localizations_extension.dart';
import '../helper/base_state.dart';

class AppApiResponse<C extends Cubit<BaseState<T>>, T> extends StatelessWidget {
  final C cubit;
  final Widget Function(T data) onSuccess;
  final Widget Function()? onLoading;
  final Widget Function(Object? error)? onError;
  final Widget Function()? onEmpty;
  final void Function(BaseState<T> state)? onStateChanged;
  final bool isSliver;

  const AppApiResponse({
    super.key,
    required this.cubit,
    required this.onSuccess,
    this.onLoading,
    this.onError,
    this.onEmpty,
    this.onStateChanged,
    this.isSliver = false,
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
        if (state.isLoading && state.data == null) {
          return onLoading?.call() ??
              (isSliver
                  ? SliverToBoxAdapter(
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  : const Center(child: CircularProgressIndicator()));
        }
        if (state.isFailure && state.data == null) {
          return onError?.call(state.error) ??
              (isSliver
                  ? SliverToBoxAdapter(
                      child: AppFailureWidget(
                        title: _getLocalizedString(
                          context,
                          (l) => l.thereIsError,
                          "Error",
                        ),
                      ),
                    )
                  : AppFailureWidget(
                      title: _getLocalizedString(
                        context,
                        (l) => l.thereIsError,
                        "Error",
                      ),
                    ));
        }
        return onSuccess.call(state.data as T);
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
}
