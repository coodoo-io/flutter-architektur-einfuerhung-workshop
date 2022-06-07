import 'package:flutter_architektur_workshop/src/data/counter/fake_data_source.dart';
import 'package:flutter_architektur_workshop/src/domain/counter/counter.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterRepoProvider = StateNotifierProvider<CounterRepo, Counter>(
  (ref) {
    Counter inistalState = Counter(counter: 0);
    return CounterRepo(inistalState);
  },
);

class CounterRepo extends StateNotifier<Counter> {
  CounterRepo(state) : super(state) {
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
