import 'dart:convert';

import 'package:test_flutter_fariq/main_test/core/utils/api_constants.dart';
import 'package:test_flutter_fariq/main_test/soal_test/data/datasource/mapper/remote/post_remote_mapper.dart';
import 'package:test_flutter_fariq/main_test/soal_test/data/datasource/source/remote/abstract/post_remote_dts.dart';
import 'package:http/http.dart' as http;
import 'package:test_flutter_fariq/main_test/soal_test/domain/model/post_model.dart';

class PostRemoteDTSImpl implements PostRemoteDTS {
  final http.Client client;
  PostRemoteDTSImpl(this.client);

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await client.get(
      Uri.parse(ApiConstants.postsUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList
          .map(
            (json) => PostRemoteMapper.fromJSON(json as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
