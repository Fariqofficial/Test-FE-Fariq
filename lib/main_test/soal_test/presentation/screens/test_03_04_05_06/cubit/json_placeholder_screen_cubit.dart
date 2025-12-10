import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/model/post_model.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/usecase/get_post.dart';

part 'json_placeholder_screen_state.dart';

class JsonPlaceholderScreenCubit extends Cubit<JsonPlaceholderScreenState> {
  final GetPost _getPost;
  JsonPlaceholderScreenCubit(this._getPost)
    : super(JsonPlaceholderScreenInitial());

  void getPosts() async {
    emit(JsonPlaceholderScreenInitial());
    final result = await _getPost();
    result.fold(
      (error) => emit(JsonPlaceholderScreenError(errorMessage: error.message)),
      (data) =>
          emit(JsonPlaceholderScreenSuccess(posts: data, showUserId: true)),
    );
  }

  void deletePost(int id) async {
    final state = this.state;
    if (state is! JsonPlaceholderScreenSuccess) return;
    final currentPosts = state.posts;
    final updatedPosts = currentPosts.where((post) => post.id != id).toList();
    emit(JsonPlaceholderScreenSuccess(posts: updatedPosts, showUserId: true));
  }

  void hideUserId() {
    final state = this.state;
    if (state is! JsonPlaceholderScreenSuccess) return;
    print('Hiding User ID: current showUserId = ${state.showUserId}');
    emit(JsonPlaceholderScreenSuccess(posts: state.posts, showUserId: false));
  }
}
