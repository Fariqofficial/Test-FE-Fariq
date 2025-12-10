import 'package:test_flutter_fariq/main_test/soal_test/domain/model/session_model.dart';

class SessionRemoteMapper extends SessionModel {
  const SessionRemoteMapper({required super.username, required super.password});

  Map<String, dynamic> toJSON() => {"username": username, "password": password};
}
