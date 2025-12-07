import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);

  @override
  List<Object> get props => [];

  String toMessage();
}

class ServerFailure extends Failure {
  const ServerFailure({required this.error, required this.code});

  final String error;
  final int code;

  String get errors => error;

  @override
  String toMessage() => error;
}

class ConnectionFailure extends Failure {
  @override
  String toMessage() => 'Check you internet connection';
}
