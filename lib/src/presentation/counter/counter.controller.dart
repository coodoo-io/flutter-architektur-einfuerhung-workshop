import 'package:flutter_architektur_workshop/src/data/counter/counter.repo.dart';
import 'package:flutter_architektur_workshop/src/domain/counter/counter.entity.dart';
import 'package:flutter_architektur_workshop/src/presentation/counter/counter.state.dart';
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
    state = state.copyWith(counterValue: AsyncValue.data(_counterEnitity));
  }

  final Reader read;
  final Counter _counterEnitity;

  increment() {
    state = state.copyWith(counterValue: const AsyncValue.loading());
    read(counterRepoProvider.notifier).increment();
    if (mounted) {
      state = state.copyWith(
        counterValue: AsyncValue.data(
          read(counterRepoProvider),
        ),
      );
    }
  }
}
