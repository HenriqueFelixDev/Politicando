import 'package:politicando/app/core/errors/app_error.dart';

class ConnectionException extends AppError {
  ConnectionException(String message) 
    : super(errorType: ErrorType.connectionException, message: message);
}