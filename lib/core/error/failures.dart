import 'package:freezed_annotation/freezed_annotation.dart';


part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.server(String message) = _ServerFailure;
  const factory Failure.network(String message) = _NetworkFailure;
  const factory Failure.websocket(String message) = _WebSocketFailure;
  const factory Failure.unknown(String message) = _UnknownFailure;
}