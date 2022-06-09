import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterControllerProvider = StateNotifierProvider.autoDispose<CounterController, void>(
  (ref) {
    return CounterController(
      ref.read,
      ref.watch(counterRepoProvider),
    );
  },
);

class CounterController extends StateNotifier {
  CounterController(this.read, this._counterEnitity) : super(null);

  final Reader read;
  final Counter _counterEnitity;

  int get counter => _counterEnitity.counter;

  increment() {
    read(counterRepoProvider.notifier).increment();
  }
}
