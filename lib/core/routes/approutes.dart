import 'package:go_router/go_router.dart';

import '../../presentation/screens/post_pages.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => PostListPage(),
    ),
  ],
);
