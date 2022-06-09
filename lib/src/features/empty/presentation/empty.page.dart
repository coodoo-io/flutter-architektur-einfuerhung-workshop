import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/presentation/counter.page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmptyPage extends ConsumerWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // uncomment this following line to prevent autodispose to trigger
    // ref.watch(counterRepoProvider).counter;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empty Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'This page does not call any providers. At this point'
                          ' the AutoDispose of the provider trigger'
                          ' and free up the located memory space. '
                          ' Which means the counter is resetted to 0.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => debugPrint('${ref.read(counterRepoProvider).counter}'),
                    child: const Text('print current state in console'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
                ),
              ),
              child: const Text('Counter page'),
            )
          ],
        ),
      ),
    );
  }
}
