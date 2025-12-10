import 'package:dartz/dartz.dart';
import 'package:test_flutter_fariq/main_test/core/error/failure.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/model/session_model.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/repositories/auth_repositories.dart';

class Login {
  final AuthRepo _repo;
  Login(this._repo);

  Future<Either<Failure, void>> call(SessionModel session) =>
      _repo.login(session);
}
