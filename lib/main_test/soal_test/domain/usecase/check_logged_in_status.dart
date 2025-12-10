import 'package:dartz/dartz.dart';
import 'package:test_flutter_fariq/main_test/core/error/failure.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/repositories/auth_repositories.dart';

class CheckLoggedInStatus {
  final AuthRepo _repo;
  CheckLoggedInStatus(this._repo);

  Future<Either<Failure, String?>> call() => _repo.getUsername();
}
