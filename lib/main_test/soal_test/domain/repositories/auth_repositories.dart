import 'package:dartz/dartz.dart';
import 'package:test_flutter_fariq/main_test/core/error/failure.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/model/session_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> login(SessionModel session);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, String?>> getUsername();
}
