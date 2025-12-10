import 'package:dartz/dartz.dart';
import 'package:test_flutter_fariq/main_test/core/error/failure.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/model/post_model.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/repositories/post_repositories.dart';

class GetPost {
  final PostRepo _repo;
  GetPost(this._repo);

  Future<Either<Failure, List<PostModel>>> call() => _repo.getPosts();
}
