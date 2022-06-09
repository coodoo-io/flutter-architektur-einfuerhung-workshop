import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/dashboard/presentation/dashboard.controller.dart';
import 'package:flutter_architektur_workshop/src/features/dashboard/presentation/dashboard.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Nur lesend zugreifen -> .notifier
    int count = ref.watch(counterRepoProvider).counter.counter;
    DashboardState dashboardState = ref.watch(dashboardControllerProvider);
    int counterValue = dashboardState.counter.counter;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'The Button has been triggered ',
            style: const TextStyle(fontSize: 20, color: Colors.black),
            children: [
              TextSpan(
                text: '$count',
                style: const TextStyle(fontSize: 60, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
