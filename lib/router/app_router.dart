import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../locator/service_locator.dart';
import '../services/storage_service.dart';
import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/detail_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,

    redirect: (context, state) async {
      final storageService = getIt<StorageService>();
      final token = await storageService.getToken();
      final loggedIn = token != null && token.isNotEmpty;

      final isSplash = state.matchedLocation == '/';
      final isLoggingIn = state.matchedLocation == '/login';

      // Let splash screen do its own thing (it has the 2-second delay + logo)
      if (isSplash) return null;

      // Not logged in, trying to reach a protected route -> bounce to login
      if (!loggedIn && !isLoggingIn) return '/login';

      // Already logged in, but trying to reach login -> bounce to home
      if (loggedIn && isLoggingIn) return '/home';

      // No redirect needed
      return null;
    },

    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/detail/:id',
        name: 'detail',
        builder: (context, state) {
          final idParam = state.pathParameters['id']!;
          final id = int.parse(idParam);
          return DetailScreen(noteId: id, note: null,);
        },
      ),
    ],

    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Route not found: ${state.uri}')),
    ),
  );
}