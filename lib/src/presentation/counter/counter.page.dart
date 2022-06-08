import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/presentation/counter/counter.controller.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends ConsumerWidget {
  MyHomePage({Key? key, required this.title, int? this.id = 0})
      : super(key: key);

  final String title;
  int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              '${ref.watch(counterControllerProvider.notifier).counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              //onPressed: () => context.go('/dashboard'),
              //onPressed: () => context.push('/dashboard'),
              //onPressed: () => context.goNamed('dashboard'),
              onPressed: () => context.goNamed('dashboard'),
              //onPressed: () =>
              //    context.pushNamed('home_id', params: {'id': '1'}),
              child: const Text('Dashboard'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(counterControllerProvider.notifier).increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
