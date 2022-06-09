
import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:flutter_architektur_workshop/src/features/counter/presentation/counter.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterControllerProvider = StateNotifierProvider.autoDispose<CounterController, CounterState>(
  (ref) {
    return CounterController(
      ref.read,
      ref.watch(counterRepoProvider),
    );
  },
);

class CounterController extends StateNotifier<CounterState> {
  CounterController(this.read, this._counterEnitity) : super(const CounterState()) {
    state = state.copyWith(
      counterValue: _counterEnitity.counter <= 5 ? AsyncValue.data(_counterEnitity) : const AsyncValue.error('error'),
    );
  }

  final Reader read;
  final Counter _counterEnitity;

  increment() {
    state = state.copyWith(counterValue: const AsyncValue.loading());
    read(counterRepoProvider.notifier).increment();
  }
}
