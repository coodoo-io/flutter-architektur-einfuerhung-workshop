import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:provider/provider.dart';

class CounterController extends ChangeNotifier {
  late BuildContext context;

  CounterController(this.context);

  int get counter => context.watch<CounterRepo>().counter;

  increment() {
    context.read<CounterRepo>().increment();
    notifyListeners();
  }
}
