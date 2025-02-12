import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/apptheme/app_theme.dart';
import 'core/helper/internet_connection_checker.dart';
import 'core/network/api_client.dart';
import 'core/routes/approutes.dart';
import 'data/datasource/post_remote_data_source.dart';
import 'data/repositories/post_repository_impl.dart';
import 'domain/usecases/get_posts.dart';
import 'presentation/cubit/post_cubit.dart';

void main() {
  final apiClient = ApiClient();
  final remoteDataSource = PostRemoteDataSourceImpl(apiClient);
  final repository = PostRepositoryImpl(remoteDataSource);
  final getPosts = GetPosts(repository);

  runApp(MyApp(getPosts));
}

class MyApp extends StatelessWidget {
  final GetPosts getPosts;

  MyApp(this.getPosts);
  final InternetChecker internetChecker = InternetChecker();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(getPosts),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        routerConfig: appRouter, // Applied Routing
      ),
    );
  }
}
