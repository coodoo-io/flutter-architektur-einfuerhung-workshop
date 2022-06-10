import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/counter/presentation/counter.page.dart';
import 'package:flutter_architektur_workshop/src/features/dashboard/presentation/dashboard.page.dart';
import 'package:flutter_architektur_workshop/src/features/empty/presentation/empty.page.dart';
import 'package:flutter_architektur_workshop/src/features/error/presentation/error.page.dart';
import 'package:flutter_architektur_workshop/src/features/login/domain/user.entity.dart';

import 'package:flutter_architektur_workshop/src/features/login/presentation/login.controller.dart';
import 'package:flutter_architektur_workshop/src/features/login/presentation/login.page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    // Wrapper um Listenable zum Notifien des state changes
    refreshListenable: RouterNotifier(ref),
    redirect: (state) {
      final AsyncValue<UserEntity>? user = ref.read(loginControllerProvider);

      final areWeLoggingIn = state.location == '/login';

      if (user == null) {
        return areWeLoggingIn ? null : '/login';
      }

      if (((user as AsyncData).value as UserEntity).name == '') {
        return areWeLoggingIn ? null : '/login';
      }

      // Wir haben einen User sind eingelogt (es kann weiter gehen)
      // Hier sind wir in der Lage zu redirecten wie wir es benötigen.
      // Rechte prüfen usw.
      if (areWeLoggingIn) return '/';

      // There's no need for a redirect at this point.
      return null;
    },
    routes: [
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: '/',
        redirect: (_) => '/home',
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        pageBuilder: (context, state) => FadeTransitionPage(
          key: const ValueKey<String>('login'),
          child: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
        routes: [
          GoRoute(
            name: 'home_id',
            path: ':id',
            builder: (_, GoRouterState state) => MyHomePage(
              title: 'Flutter Demo Home Page with ID ',
              id: int.tryParse(state.params['id']!),
            ),
          )
        ],
      ),
      GoRoute(
        name: 'dashboard',
        path: '/dashboard',
        builder: (BuildContext context, GoRouterState state) =>
            const Dashboard(),
      ),
      GoRoute(
        name: 'empty',
        path: '/empty',
        builder: (BuildContext context, GoRouterState state) =>
            const EmptyPage(),
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(text: state.error.toString()),
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  /// Creates a Notifier to be used in GoRouter
  ///
  /// While it is not recommended to use `ChangeNotifier` anywhere else
  /// (reference: https://riverpod.dev/docs/concepts/providers/#different-types-of-providers),
  /// `ChangeNotifier` is a forced choice with go_router.
  ///
  /// GoRouter's refreshListenable only accepts a `Listenable` object as a parameter
  /// and therefore `ChangeNotifier` is used here,
  /// whereas `StateNotifier` is not a `Listenable`, so we can't use it.
  ///
  /// Here we inject a `Ref` so that it's possible to exploit `ref.listen()` to
  /// notify GoRouter that something's changed in our providers.
  ///
  /// Note how we're forced to explicitly call `notifyListeners()`
  /// to make this work.
  RouterNotifier(this._ref) {
    _ref.listen<AsyncValue<UserEntity>?>(loginControllerProvider, (_, state) {
      if (state is AsyncData<UserEntity>) {
        notifyListeners();
      }
    });
  }
}

/**
 * Transition class for Custom Transition between Pages
 */
class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
            key: key,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, -1.0);
              const end = Offset(0.0, 0.0);
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            child: child);
}
