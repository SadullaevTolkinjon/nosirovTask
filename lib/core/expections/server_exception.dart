
class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

class WebSocketException implements Exception {
  final String message;
  const WebSocketException(this.message);
}