import 'package:flutter/material.dart';
import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterControllerProvider = ChangeNotifierProvider.autoDispose((ref) {
  return CounterController(ref.read);
});

class CounterController extends ChangeNotifier {
  CounterController(this.read) {
    _counter = read(counterRepoProvider).counter;
  }

  Reader read;
  late Counter _counter;

  Counter get counter => _counter;

  increment() {
    _counter = read(counterRepoProvider).increment();
    notifyListeners();
  }
}
