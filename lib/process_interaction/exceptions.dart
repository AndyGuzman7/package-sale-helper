/// Exception thrown when request fails
class RequestException implements Exception {}

/// Exception thrown when backend return errors
class ServerException implements Exception {}

/// Exception thrown when error occurs on client side
class InternalException implements Exception {}

/// Exception thrown when query fails
class DatabaseException implements Exception {}

/// Exception thrown when No Element found
class NotFoundException implements Exception {}

/// Exception thrown when Invalid Resolution
class InvalidResolutionException implements Exception {}

/// Exception thrown when Invalid Resolution
class NoResolutionException implements Exception {
  const NoResolutionException(this.message);

  final String message;
}

/// Exception thrown when No Client Found
class NoClientException implements Exception {}

/// Exception thrown when request returns invalid
class ResultException implements Exception {
  const ResultException(this.message);

  final String message;
}

/// Exception thrown when No Client Found
class UnauthorizedException implements Exception {}

/// Exception thrown when No Internet Connection
class NoInternetException implements Exception {}

class DatabaseNoResult implements Exception {}

enum ResultExceptionType { noShift }

class ResultExceptionCustom implements Exception {
  const ResultExceptionCustom(this.message, this.type);
  final ResultExceptionType type;
  final String message;
}
