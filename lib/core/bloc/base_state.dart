import 'package:equatable/equatable.dart';

enum BaseStatus { initial, loading, success, failure }

class BaseState<T> extends Equatable {
  final BaseStatus status;
  final T? data;
  final Object? error;
  final String? identifier;

  const BaseState._({
    required this.status,
    this.data,
    this.error,
    this.identifier,
  });

  /// INITIAL
  const BaseState.initial({String? identifier})
    : this._(status: BaseStatus.initial, identifier: identifier ?? "initial");

  /// LOADING
  const BaseState.loading({T? data, String? identifier})
    : this._(status: BaseStatus.loading, data: data, identifier: identifier);

  /// SUCCESS
  const BaseState.success({T? data, String? identifier})
    : this._(status: BaseStatus.success, data: data, identifier: identifier);

  /// FAILURE
  const BaseState.failure({Object? error, String? identifier})
    : this._(status: BaseStatus.failure, error: error, identifier: identifier);

  /// COPY WITH
  BaseState<T> copyWith({
    BaseStatus? status,
    T? data,
    Object? error,
    String? identifier,
  }) {
    return BaseState._(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
      identifier: identifier ?? this.identifier,
    );
  }

  /// READY METHODS (🔥 دي اللي بتسهّل حياتك)
  BaseState<T> toLoading({String? identifier}) {
    return BaseState.loading(data: data, identifier: identifier);
  }

  BaseState<T> toSuccess({T? newData, String? identifier}) {
    return BaseState.success(data: newData ?? data, identifier: identifier);
  }

  BaseState<T> toFailure(Object error, {String? identifier}) {
    return BaseState.failure(error: error, identifier: identifier);
  }

  bool get isInitial => status == BaseStatus.initial;

  bool get isLoading => status == BaseStatus.loading;

  bool get isSuccess => status == BaseStatus.success;

  bool get isFailure => status == BaseStatus.failure;

  @override
  List<Object?> get props => [status, data, error, identifier];
}

extension BaseStateExtensions<T> on BaseState<T> {
  /// SUCCESS
  BaseState<T> success({T? data, String? identifier}) {
    return BaseState.success(data: data ?? this.data, identifier: identifier);
  }

  /// LOADING
  BaseState<T> loading({String? identifier}) {
    return BaseState.loading(data: data, identifier: identifier);
  }

  /// FAILURE
  BaseState<T> failure(Object error, {String? identifier}) {
    return BaseState.failure(error: error, identifier: identifier);
  }
}
