abstract class AppError {
  final dynamic data;
  final ErrorType errorType;
  final String message;

  AppError({
    required this.errorType,
    required this.message,
    this.data
  });
}

enum ErrorType {
  connectionException
}