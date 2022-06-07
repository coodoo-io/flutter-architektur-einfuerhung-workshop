
import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/presentation/counter/counter.page.dart';
import 'package:flutter_architektur_workshop/src/presentation/dashboard/dashboard.page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final navigationControllerProvider = Provider((ref){
  return GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>  const MyHomePage(title: 'Flutter Demo Home Page'),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (BuildContext context, GoRouterState state) => const Dashboard(),
    ),
  ]);
});