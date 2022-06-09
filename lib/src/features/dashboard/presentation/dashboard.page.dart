import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/dashboard/presentation/dashboard.controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: 'The Button has been triggered ',
                style: const TextStyle(fontSize: 20, color: Colors.black),
                children: [
                  ref.watch(dashboardControllerProvider).counterValue.when(
                      data: (data) => TextSpan(
                        text: '${data.counter}',
                        style: const TextStyle(fontSize: 60, color: Colors.blue),
                      ),
                      error: (error, _) => const TextSpan(text: 'Err'),
                      loading: () => const TextSpan(text: 'loadling..')),
                  const TextSpan(text: ' times.'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => context.go('/empty'),
                child: const Text('Trigger AutoDispose'))
          ],
        ),
      ),
    );
  }
}
