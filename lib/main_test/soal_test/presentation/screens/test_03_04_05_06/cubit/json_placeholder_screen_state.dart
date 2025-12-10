part of 'json_placeholder_screen_cubit.dart';

sealed class JsonPlaceholderScreenState extends Equatable {
  const JsonPlaceholderScreenState();

  @override
  List<Object> get props => [];
}

final class JsonPlaceholderScreenInitial extends JsonPlaceholderScreenState {}

final class JsonPlaceholderScreenSuccess extends JsonPlaceholderScreenState {
  final List<PostModel> posts;
  final bool showUserId;
  const JsonPlaceholderScreenSuccess({
    required this.posts,
    this.showUserId = true,
  });
  @override
  List<Object> get props => [posts, showUserId];
}

final class JsonPlaceholderScreenError extends JsonPlaceholderScreenState {
  final String errorMessage;
  const JsonPlaceholderScreenError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
