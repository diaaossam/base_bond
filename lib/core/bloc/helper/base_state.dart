import 'package:equatable/equatable.dart';

enum BaseStatus { initial, loading, success, failure }

class BaseState<T> extends Equatable {
  final BaseStatus status;
  final T? data;
  final Object? error;
  final String? identifier;

  const BaseState({
    this.status = BaseStatus.initial,
    this.data,
    this.error,
    this.identifier,
  });

  // ============================================================================
  // FACTORY CONSTRUCTORS
  // ============================================================================

  /// Creates an initial state
  factory BaseState.initial({T? data, String? identifier}) {
    return BaseState(
      status: BaseStatus.initial,
      data: data,
      identifier: identifier,
    );
  }

  /// Creates a loading state
  factory BaseState.loading({T? data, String? identifier}) {
    return BaseState(
      status: BaseStatus.loading,
      data: data,
      identifier: identifier,
    );
  }

  /// Creates a success state
  factory BaseState.success({T? data, String? identifier}) {
    return BaseState(
      status: BaseStatus.success,
      data: data,
      identifier: identifier,
    );
  }

  /// Creates a failure state
  factory BaseState.failure({Object? error, T? data, String? identifier}) {
    return BaseState(
      status: BaseStatus.failure,
      error: error,
      data: data,
      identifier: identifier,
    );
  }

  // ============================================================================
  // INSTANCE METHODS (for chaining with existing state data)
  // ============================================================================

  /// Returns a new loading state, preserving current data
  BaseState<T> loading({String? identifier}) {
    return copyWith(
      status: BaseStatus.loading,
      identifier: identifier,
    );
  }

  /// Returns a new success state, optionally updating data
  BaseState<T> success({T? data, String? identifier}) {
    return BaseState(
      status: BaseStatus.success,
      data: data ?? this.data,
      identifier: identifier,
    );
  }

  /// Returns a new failure state, preserving current data
  BaseState<T> failure(Object? error, {String? identifier}) {
    return copyWith(
      status: BaseStatus.failure,
      error: error,
      identifier: identifier,
    );
  }

  // ============================================================================
  // STATUS GETTERS
  // ============================================================================

  /// Returns true if status is initial
  bool get isInitial => status == BaseStatus.initial;

  /// Returns true if status is loading
  bool get isLoading => status == BaseStatus.loading;

  /// Returns true if status is success
  bool get isSuccess => status == BaseStatus.success;

  /// Returns true if status is failure
  bool get isFailure => status == BaseStatus.failure;



  BaseState<T> copyWith({
    BaseStatus? status,
    T? data,
    Object? error,
    String? identifier,
  }) {
    return BaseState(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
      identifier: identifier ?? this.identifier,
    );
  }

  @override
  List<Object?> get props => [status, data, error, identifier];
}
