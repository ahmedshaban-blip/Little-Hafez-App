/// Base failure contract for domain and data boundaries.
abstract class Failure {
  const Failure(this.message);

  final String message;
}

/// Failure representing unexpected local or mock data errors.
final class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}
