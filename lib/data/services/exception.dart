class CustomException implements Exception {
  final int code;
  final String message;
  final String prefix;

  CustomException(
      {required this.code, required this.message, required this.prefix});

  @override
  String toString() {
    return "$prefix $message";
  }

  String getMessage() {
    return message;
  }

  String getCode() {
    return code.toString();
  }
}

class FetchDataException extends CustomException {
  FetchDataException([code, message])
      : super(
            code: code,
            message: message,
            prefix: "Error During Communication: ");
}

class UploadFileException extends CustomException {
  UploadFileException([code, message])
      : super(code: code, message: message, prefix: "Error Upload File: ");
}

class ServerError extends CustomException {
  ServerError([code, message])
      : super(code: code, message: message, prefix: "Server didn't respond: ");
}

class BadRequestException extends CustomException {
  BadRequestException([code, message])
      : super(code: code, message: message, prefix: "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([code, message])
      : super(code: code, message: message, prefix: "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([code, message])
      : super(code: code, message: message, prefix: "Invalid Input: ");
}
