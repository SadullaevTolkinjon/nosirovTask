class NameUnavailableException implements Exception {
   String? message;
   NameUnavailableException(this.message);
  @override
  String toString() => '$message';
}