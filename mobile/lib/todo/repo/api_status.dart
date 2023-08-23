class Success {
  int code;
  Object response;
  Success({required this.code, required this.response});
}

class Failure {
  int code;
  Object error_response;
  Failure({required this.code, required this.error_response});
}
