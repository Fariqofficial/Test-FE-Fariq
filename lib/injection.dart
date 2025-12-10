import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter_fariq/main_test/soal_test/data/datasource/source/remote/abstract/post_remote_dts.dart';
import 'package:test_flutter_fariq/main_test/soal_test/data/datasource/source/remote/abstract/session_remote_dts.dart';
import 'package:test_flutter_fariq/main_test/soal_test/data/datasource/source/remote/implementation/post_remote_dts_impl.dart';
import 'package:test_flutter_fariq/main_test/soal_test/data/datasource/source/remote/implementation/session_remote_dts_impl.dart';
import 'package:test_flutter_fariq/main_test/soal_test/data/repositories_impl/post_repositories_impl.dart';
import 'package:test_flutter_fariq/main_test/soal_test/data/repositories_impl/session_repositories_impl.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/repositories/auth_repositories.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/repositories/post_repositories.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/usecase/check_logged_in_status.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/usecase/get_post.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/usecase/login.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/usecase/logout.dart';
import 'package:test_flutter_fariq/main_test/soal_test/presentation/screens/test_03_04_05_06/cubit/json_placeholder_screen_cubit.dart';
import 'package:test_flutter_fariq/main_test/soal_test/presentation/screens/test_09/cubit/login_screen_cubit.dart';

final di = GetIt.instance;

Future<void> initInjection() async {
  final pref = await SharedPreferences.getInstance();
  di.registerLazySingleton<SharedPreferences>(() => pref);

  di.registerLazySingleton<http.Client>(() => http.Client());

  di.registerLazySingleton<PostRepo>(() => PostReposImpl(di()));
  di.registerLazySingleton<AuthRepo>(() => SessionRepositoriesImpl(di()));

  di.registerLazySingleton(() => GetPost(di()));
  di.registerLazySingleton(() => Login(di()));
  di.registerLazySingleton(() => LogoutUC(di()));
  di.registerLazySingleton(() => CheckLoggedInStatus(di()));

  di.registerLazySingleton<PostRemoteDTS>(() => PostRemoteDTSImpl(di()));
  di.registerLazySingleton<SessionRemoteDTS>(() => SessionRemoteDTSImpl(di()));

  di.registerFactory(() => JsonPlaceholderScreenCubit(di()));
  di.registerFactory(() => LoginScreenCubit(di(), di(), di()));
}
