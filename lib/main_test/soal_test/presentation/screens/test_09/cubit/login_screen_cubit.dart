import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/model/session_model.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/usecase/check_logged_in_status.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/usecase/login.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/usecase/logout.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  final Login _login;
  final LogoutUC _logoutUC;
  final CheckLoggedInStatus _checkLoggedInStatus;
  LoginScreenCubit(this._login, this._logoutUC, this._checkLoggedInStatus)
    : super(LoginScreenInitial());

  void checkLoginStatus() async {
    emit(LoginScreenLoading());
    final result = await _checkLoggedInStatus();
    result.fold((error) => emit(LoginScreenError(message: error.message)), (
      data,
    ) {
      if (data != null && data.isNotEmpty) {
        emit(LoginScreenSuccess(username: data));
      } else {
        emit(LoginScreenInitial());
      }
    });
  }

  void login({required String username, required String password}) async {
    if (username.isEmpty || password.isEmpty) {
      emit(LoginScreenError(message: "Username & password harus di isi!"));
      return;
    }

    emit(LoginScreenLoading());
    final data = SessionModel(username: username, password: password);
    final result = await _login(data);

    result.fold(
      (error) => LoginScreenError(message: error.message),
      (_) => emit(LoginScreenSuccess(username: username)),
    );
  }

  void logout() async {
    emit(LoginScreenLoading());
    final result = await _logoutUC();
    result.fold(
      (error) => emit(LoginScreenError(message: error.message)),
      (_) => emit(LoginScreenInitial()),
    );
  }
}
