import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];

  String toMessage() => message;
}

class ServerFailure extends Failure {
  const ServerFailure({required String error, required int code})
    : super(message: error, statusCode: code);

  String get errorMessage => message;

  int get code => statusCode ?? 0;
}

class ConnectionFailure extends Failure {
  const ConnectionFailure()
    : super(message: 'Check your internet connection', statusCode: null);
}
