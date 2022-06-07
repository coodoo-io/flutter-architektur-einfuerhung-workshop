import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/presentation/counter/counter.controller.dart';
import 'package:flutter_architektur_workshop/src/presentation/dashboard/dashboard.page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              '${ref.watch(counterControllerProvider.notifier).counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () => context.go('/dashboard'),
                child: const Text('Dashboard'))
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
