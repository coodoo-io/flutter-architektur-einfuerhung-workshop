import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:provider/provider.dart';

class CounterController extends ChangeNotifier {
  late BuildContext context;

  CounterController(this.context) {
    _counter = context.read<CounterRepo>().counter;
  }

  late Counter _counter;

  Counter get counter => _counter;

  increment() {
    _counter = context.read<CounterRepo>().increment();
    notifyListeners();
  }
}
