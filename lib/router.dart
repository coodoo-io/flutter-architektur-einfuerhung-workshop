import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/presentation/counter/counter.page.dart';
import 'package:flutter_architektur_workshop/src/presentation/dashboard/dashboard.page.dart';

import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
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
      builder: (BuildContext context, GoRouterState state) => const Dashboard(),
    ),
  ],
);
