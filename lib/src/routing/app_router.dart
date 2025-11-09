import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone_pro/src/features/auth/presentation/custom_signin_screen.dart';
import 'package:instagram_clone_pro/src/features/direct/presentation/chat_screen.dart';
import 'package:instagram_clone_pro/src/features/direct/presentation/direct_screen.dart';
import 'package:instagram_clone_pro/src/features/posts/presentation/home_screen.dart';
import 'package:instagram_clone_pro/src/features/profile/presentation/profile_screen.dart';
import 'package:instagram_clone_pro/src/features/reels/presentation/reels_screen.dart';
import 'package:instagram_clone_pro/src/features/search/presentation/search_screen.dart';
import 'package:instagram_clone_pro/src/routing/go_router_refresh_stream.dart';
import 'package:instagram_clone_pro/src/routing/not_found_screen.dart';
import 'package:instagram_clone_pro/src/routing/root_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute { home, search, direct, profile, reels, signIn, account, chat }

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  final authRepository = ref.watch(firebaseAuthProvider);
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/sign-in',
    debugLogDiagnostics: false,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      if (isLoggedIn) {
        if (state.matchedLocation == '/sign-in') {
          return '/home';
        }
      } else {
        if (state.matchedLocation != '/sign-in') {
          return '/sign-in';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      // auth
      GoRoute(
        path: '/sign-in',
        name: AppRoute.signIn.name,
        builder: (context, state) => const CustomSigninScreen(),
      ),

      // Main part of app
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return RootScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => HomeScreen(),
                name: AppRoute.home.name,
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/reels',
                builder: (context, state) => ReelsScreen(),
                name: AppRoute.search.name,
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/direct',
                name: AppRoute.direct.name,
                builder: (context, state) => DirectScreen(),
                routes: [
                  // chat screen
                  GoRoute(
                    path: 'chat/:id',
                    name: AppRoute.chat.name,
                    builder: (context, state) {
                      final chatId = state.pathParameters['id'];
                      return ChatScreen(chatId: chatId!);
                    },
                  ),
                ],
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                builder: (context, state) => SearchScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
