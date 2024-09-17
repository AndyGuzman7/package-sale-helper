import 'package:equatable/equatable.dart';
import 'package:sale_helper_zencillo/process_interaction/exceptions.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class RequestFailure extends Failure {}

class SocketFailure extends Failure {}

class DatabaseFailure extends Failure {}

class NotFoundFailure extends Failure {}

class InvalidResolutionFailure extends Failure {}

class NoResolutionFailure extends Failure {
  NoResolutionFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class NoClientFailure extends Failure {}

class ResultFailure extends Failure {
  ResultFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class ResultFailureCustom extends Failure {
  ResultFailureCustom(this.message, this.type);

  final String message;
  final ResultExceptionType type;

  @override
  List<Object?> get props => [message];
}

class ConnectionFailure extends Failure {}

class UnauthorizedFailure extends Failure {}

class NoInternetFailure extends Failure {}

class DatabaseNoResultFailure extends Failure {}
