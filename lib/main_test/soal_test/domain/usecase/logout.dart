import 'package:dartz/dartz.dart';
import 'package:test_flutter_fariq/main_test/core/error/failure.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/repositories/auth_repositories.dart';

class LogoutUC {
  final AuthRepo _repo;
  LogoutUC(this._repo);

  Future<Either<Failure, void>> call() async => await _repo.logout();
}
