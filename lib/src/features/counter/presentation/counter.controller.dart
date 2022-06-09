import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterControllerProvider = ChangeNotifierProvider((ref) {
  return CounterController(
    ref.read,
    Counter(
      counter: ref.watch(counterRepoProvider).counter,
    ),
  );
});

class CounterController extends ChangeNotifier {
  CounterController(this.read, this._counter);

  Reader read;
  Counter _counter;

  int get counter => _counter.counter;

  increment() {
    read(counterRepoProvider).increment();
    notifyListeners();
  }
}
