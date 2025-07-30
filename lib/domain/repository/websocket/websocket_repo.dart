import 'package:dartz/dartz.dart';
import 'package:nosirovtask/core/error/failures.dart';

abstract class WebSocketRepository {
  Future<Either<Failure, void>> connect(String url);
  Future<Either<Failure, void>> disconnect();
  //Stream<Either<Failure, WebSocketData>> getDataStream();
  Future<Either<Failure, void>> sendMessage(String message);
}