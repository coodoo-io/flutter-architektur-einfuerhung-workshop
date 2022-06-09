import 'package:flutter_architektur_workshop/src/features/counter/data/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:flutter_architektur_workshop/src/features/counter/presentation/counter.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterControllerProvider = StateNotifierProvider.autoDispose<CounterController, CounterState>((ref) {
  return CounterController(const CounterState(), ref.read);
});

class CounterController extends StateNotifier<CounterState> {
  CounterController(CounterState state, this.read) : super(state) {
    Counter _counter = read(counterRepoProvider).counter;
    state = state.copyWith(counter: _counter);
  }

  Reader read;

  increment() {
    Counter _counter = read(counterRepoProvider).increment();
    state = state.copyWith(counter: _counter);
  }

  Future<void> initalValue(int initalValue) async {
    Future.delayed(Duration.zero, () {
      state = state.copyWith(counter: read(counterRepoProvider).setInitalCounterValue(initalValue));
    });
  }
}
