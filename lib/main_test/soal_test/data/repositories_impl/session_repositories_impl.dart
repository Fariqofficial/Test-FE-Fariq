import 'package:dartz/dartz.dart';
import 'package:test_flutter_fariq/main_test/core/error/failure.dart';
import 'package:test_flutter_fariq/main_test/soal_test/data/datasource/source/remote/abstract/session_remote_dts.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/model/session_model.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/repositories/auth_repositories.dart';

class SessionRepositoriesImpl implements AuthRepo {
  final SessionRemoteDTS _remoteDTS;
  SessionRepositoriesImpl(this._remoteDTS);

  @override
  Future<Either<Failure, String?>> getUsername() async {
    try {
      final username = await _remoteDTS.getUsername();
      return Right(username);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> login(SessionModel session) async {
    try {
      final result = await _remoteDTS.saveSession(
        username: session.username,
        password: session.password,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final result = await _remoteDTS.clearSession();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
