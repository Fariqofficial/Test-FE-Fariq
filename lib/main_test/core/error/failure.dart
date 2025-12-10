import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? code;
  final dynamic extra;
  const Failure({required this.message, this.code, this.extra});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([String? message, int? code])
    : super(
        message:
            message ?? "Server is temporarily unavailable. Try again later.",
        code: code,
      );
}

class ConnectionFailure extends Failure {
  const ConnectionFailure([String? message])
    : super(
        message: message ?? "Unable to reach the server. Please try again.",
      );
}

class UnknownFailure extends Failure {
  const UnknownFailure([String? message])
    : super(message: message ?? "Unknown error");
}
