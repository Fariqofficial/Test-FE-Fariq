import 'package:test_flutter_fariq/main_test/soal_test/domain/model/post_model.dart';

abstract class PostRemoteDTS {
  Future<List<PostModel>> getPosts();
}
