class ValidationException implements Exception {
  const ValidationException([this.message = '']);

  final String message;

  @override
  String toString() {
    String result = 'ValidationException';
    if (message is String) return '$result: $message';
    return result;
  }

  String getMessage() {
    return message;
  }
}
