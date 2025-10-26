import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizo/pages/home.dart';
import 'package:quizo/pages/onboarding.dart';
import 'package:quizo/pages/quiz.dart';

void main() {
  final GoRouter router = GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        path: '/quiz/:category',
        builder: (context, state) {
          final name = state.pathParameters['category']!;
          return Quiz(categoryName: name);
        },
      ),
    ],
  );

  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: false,
      ),
      routerConfig: router,
    );
  }
}
