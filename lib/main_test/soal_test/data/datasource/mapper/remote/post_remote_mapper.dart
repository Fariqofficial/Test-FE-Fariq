import 'package:test_flutter_fariq/main_test/soal_test/domain/model/post_model.dart';

class PostRemoteMapper extends PostModel {
  const PostRemoteMapper({
    required super.userId,
    required super.id,
    required super.title,
    required super.body,
  });

  factory PostRemoteMapper.fromJSON(Map<String, dynamic> json) {
    return PostRemoteMapper(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }

  Map<String, dynamic> toJSON() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
