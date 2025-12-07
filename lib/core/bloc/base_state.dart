import 'package:equatable/equatable.dart';

enum BaseStatus { initial, loading, success, failure }

class BaseState<T> extends Equatable {
  const BaseState._({
    required this.status,
    this.data,
    this.error,
    this.identifier,
  });

  /// ======== FACTORY HELPERS ========
  factory BaseState.initial({String? identifier}) =>
      BaseState._(status: BaseStatus.initial, identifier: identifier);

  factory BaseState.loading({
    String? identifier,
    bool clearData = true,
    bool clearError = true,
    T? previousData,
    Object? previousError,
  }) => BaseState._(
    status: BaseStatus.loading,
    data: clearData ? null : previousData,
    error: clearError ? null : previousError,
    identifier: identifier,
  );

  factory BaseState.success({
    T? data,
    String? identifier,
    bool clearError = true,
  }) => BaseState._(
    status: BaseStatus.success,
    data: data,
    error: clearError ? null : null,
    identifier: identifier,
  );

  factory BaseState.failure({
    Object? error,
    String? identifier,
    bool clearData = true,
    T? previousData,
  }) => BaseState._(
    status: BaseStatus.failure,
    error: error,
    data: clearData ? null : previousData,
    identifier: identifier,
  );

  /// ======== FIELDS ========
  final BaseStatus status;
  final T? data;
  final Object? error;
  final String? identifier;

  /// ======== GETTERS ========
  bool get isInitial => status == BaseStatus.initial;

  bool get isLoading => status == BaseStatus.loading;

  bool get isSuccess => status == BaseStatus.success;

  bool get isFailure => status == BaseStatus.failure;

  /// ======== COPYWITH ========
  BaseState<T> copyWith({
    BaseStatus? status,
    T? data,
    Object? error,
    String? identifier,
    bool clearData = false,
    bool clearError = false,
  }) {
    return BaseState._(
      status: status ?? this.status,
      data: clearData ? null : data ?? this.data,
      error: clearError ? null : error ?? this.error,
      identifier: identifier ?? this.identifier,
    );
  }

  /// ======== HELPER METHODS ========
  BaseState<T> toLoading({String? identifier}) => BaseState.loading(
    identifier: identifier ?? this.identifier,
    previousData: data,
    previousError: error,
  );

  BaseState<T> toSuccess({T? data, String? identifier}) => BaseState.success(
    data: data ?? this.data,
    identifier: identifier ?? this.identifier,
  );

  BaseState<T> toFailure({Object? error, String? identifier}) =>
      BaseState.failure(
        error: error,
        previousData: data,
        identifier: identifier ?? this.identifier,
      );

  @override
  List<Object?> get props => [status, data, error, identifier];

  @override
  String toString() =>
      'BaseState(status: $status, data: $data, error: $error, identifier: $identifier)';
}
