abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  final int? code;

  const ServerFailure(String message, {this.code}) : super(message);
}
