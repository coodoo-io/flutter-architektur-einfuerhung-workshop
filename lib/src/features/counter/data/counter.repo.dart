
import 'package:flutter_architektur_workshop/src/features/counter/data/fake_data_source.dart';
import 'package:flutter_architektur_workshop/src/features/counter/domain/counter.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterRepoProvider = StateNotifierProvider.autoDispose<CounterRepo, Counter>(
  (ref) {
    Counter inistalState = Counter(counter: 0);
    return CounterRepo(inistalState);
  },
);

class CounterRepo extends StateNotifier<Counter> {
  CounterRepo(Counter state) : super(state) {
    _fetchData();
  }

  int get counter => state.counter;

  void increment() {
    state = state.copyWith(counter: state.counter + 1);
  }

  void _fetchData() {
    final int receivedData = FakeDataSource.fetchData();
    state = Counter(counter: receivedData);
  }
}
