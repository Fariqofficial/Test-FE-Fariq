import 'package:dartz/dartz.dart';
import 'package:test_flutter_fariq/main_test/core/error/failure.dart';
import 'package:test_flutter_fariq/main_test/soal_test/data/datasource/source/remote/abstract/post_remote_dts.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/model/post_model.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/repositories/post_repositories.dart';

class PostReposImpl implements PostRepo {
  final PostRemoteDTS _remoteDTS;
  const PostReposImpl(this._remoteDTS);
  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    try {
      final data = await _remoteDTS.getPosts();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
