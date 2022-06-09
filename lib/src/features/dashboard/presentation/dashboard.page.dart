import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/dashboard/presentation/dashboard.controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Nur lesend zugreifen -> .notifier
    int counterValue = ref.watch(dashboardControllerProvider.notifier).counter.counter;
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
                text: '$counterValue',
                style: const TextStyle(fontSize: 60, color: Colors.blue),
              ),
              const TextSpan(text: ' times.'),
            ],
          ),
        ),
      ),
    );
  }
}
