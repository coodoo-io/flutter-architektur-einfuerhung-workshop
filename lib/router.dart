import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/presentation/counter.controller.dart';
import 'package:flutter_architektur_workshop/src/features/counter/presentation/counter.page.dart';
import 'package:flutter_architektur_workshop/src/features/dashboard/presentation/dashboard.page.dart';
import 'package:flutter_architektur_workshop/src/features/empty/presentation/empty.page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: [
    GoRoute(
      path: '/',
      redirect: (_) => '/home',
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (_, __) => MyHomePage(title: 'Flutter Demo Home Page'),
      routes: [
        GoRoute(
          name: 'home_id',
          path: ':id',
          builder: (_, GoRouterState state) {
            print('BUILDER ${state.location}');
            int? value = int.tryParse(state.params['id']!);
            ref.read(counterControllerProvider.notifier).initalValue(value ?? 0);

            return MyHomePage(title: 'Flutter Demo Home Page with ID ', id: int.tryParse(state.params['id']!));
          },
        )
      ],
    ),
    GoRoute(
      name: 'dashboard',
      path: '/dashboard',
      builder: (BuildContext context, GoRouterState state) => const Dashboard(),
    ),
    GoRoute(
      name: 'empty',
      path: '/empty',
      builder: (BuildContext context, GoRouterState state) => const EmptyPage(),
    ),
  ], initialLocation: '/home');
});
