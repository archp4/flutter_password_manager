class CustomError implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  CustomError({
    required this.message,
    this.code,
    this.details,
  });

  @override
  String toString() {
    if (code != null) {
      return 'Error: [$code] $message';
    }
    return 'Error: $message';
  }
}
