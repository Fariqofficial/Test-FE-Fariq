import 'package:equatable/equatable.dart';

class SessionModel extends Equatable {
  final String username;
  final String password;

  const SessionModel({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
