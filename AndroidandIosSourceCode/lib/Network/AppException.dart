class AppException implements Exception {
  final _meesage;
  final _prefix;

  AppException([this._meesage, this._prefix]);

  String toString() {
    return "$_prefix$_meesage";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "Error during communication");
}

class BadRequestException extends AppException {
  BadRequestException([String message]) : super(message, "Invalid Request");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String message])
      : super(message, "Invalid Credentials");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input");
}
