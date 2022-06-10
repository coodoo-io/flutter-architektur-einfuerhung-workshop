import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/counter/presentation/counter.controller.dart';
import 'package:flutter_architektur_workshop/src/features/dashboard/presentation/dashboard.page.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    int counterValue = context.watch<CounterController>().counter.counter;
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
        onPressed: () => {context.read<CounterController>().increment()},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

