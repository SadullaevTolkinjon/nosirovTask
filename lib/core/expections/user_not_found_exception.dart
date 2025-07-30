class UserNotFoundException implements Exception {
  String? message;
  UserNotFoundException(this.message);
}
