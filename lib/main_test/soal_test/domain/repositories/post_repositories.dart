import 'package:dartz/dartz.dart';
import 'package:test_flutter_fariq/main_test/core/error/failure.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/model/post_model.dart';

abstract class PostRepo {
  Future<Either<Failure, List<PostModel>>> getPosts();
}
