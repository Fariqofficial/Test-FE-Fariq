import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_flutter_fariq/injection.dart';
import 'package:test_flutter_fariq/main_test/soal_test/domain/model/post_model.dart';
import 'package:test_flutter_fariq/main_test/soal_test/presentation/screens/test_03_04_05_06/cubit/json_placeholder_screen_cubit.dart';

part 'widgets/content.dart';
part 'widgets/loading.dart';

class JSONPlaceholderScreen extends StatelessWidget {
  const JSONPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<JsonPlaceholderScreenCubit>()..getPosts(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "JSON PLACEHOLDER DATA",
            style: TextStyle(
              fontSize: 16,
              color: Color(0XFF262626),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.white,
        ),
        body:
            BlocBuilder<JsonPlaceholderScreenCubit, JsonPlaceholderScreenState>(
              builder: (context, state) => switch (state) {
                JsonPlaceholderScreenInitial() => _Loading(),
                JsonPlaceholderScreenError() => Center(
                  child: Text(
                    "Error: ${state.errorMessage}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                JsonPlaceholderScreenSuccess() => _Content(
                  posts: state.posts,
                  showUserId: state.showUserId,
                ),
              },
            ),
      ),
    );
  }
}
