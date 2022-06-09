import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/counter/presentation/counter.controller.dart';
import 'package:flutter_architektur_workshop/src/features/counter/presentation/counter.state.dart';
import 'package:flutter_architektur_workshop/src/features/dashboard/presentation/dashboard.page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Auf Änderungen hören und anschließend neu bauen
    CounterState counterState = ref.watch(counterControllerProvider);
    int counterValue = counterState.counter.counter;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counterValue',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (build) => const Dashboard(),
                      ),
                    ),
                child: const Text('Dashboard'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.watch(counterControllerProvider.notifier).increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
