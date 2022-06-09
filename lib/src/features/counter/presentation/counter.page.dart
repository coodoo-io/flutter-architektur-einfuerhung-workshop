import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/counter/presentation/counter.controller.dart';
import 'package:flutter_architektur_workshop/src/features/counter/presentation/counter.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title, this.id = 0}) : super(key: key);

  final String title;
  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Auf Änderungen hören und anschließend neu bauen
    CounterState counterState = ref.watch(counterControllerProvider);
    int counterValue = counterState.counter.counter;
    return Scaffold(
      appBar: AppBar(
        title: Text('$title $id'),
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
              //onPressed: () => context.go('/dashboard'),
              onPressed: () => context.push('/dashboard'),
              //onPressed: () => context.goNamed('dashboard'),
              //onPressed: () => context.goNamed('dashboard'),
              //onPressed: () =>
              //    context.pushNamed('home_id', params: {'id': '1'}),
              child: const Text('Dashboard'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterControllerProvider.notifier).increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
